#!/usr/bin/bash


function update_project()
{
	path=$1

	[ -d $path/.git ] || return
	pushd $path > /dev/null

	echo "[$path] Fetching ..."

	git fetch origin &> /dev/null

	if ! git diff --exit-code &> /dev/null ; then
		popd > /dev/null
		return
	fi

	current=$(git symbolic-ref --short HEAD)
	if [[ "master develop" != *${current}* ]] ; then
		popd > /dev/null
		return
	fi

	branches=( $(git for-each-ref --format='%(refname:short)' refs/heads/) )
	behind=()

	for b in ${branches[@]} ; do
		[ -n "$(git branch -r --list origin/$b)" ] || continue

		remote=$(git rev-parse origin/$b)
		last=$(git merge-base $b origin/$b)

		[ $remote != $last ] && behind+=($b)
	done

	if [ -z "${behind[*]}" ] ; then
		popd > /dev/null
		return
	fi

	for b in "${behind[@]}" ; do
		echo "[$path]  Updating $b ..."

		git checkout $b &> /dev/null
		git rebase origin/$b &> /dev/null
	done

	git checkout $current &> /dev/null

	[ -d submodules ] && git submodule update --init &> /dev/null

	popd > /dev/null
}


pushd ~crunge/projects/ > /dev/null

for d in * ; do
	update_project $d
done

#export -f update_project
#parallel --will-cite --lb -j2 update_project {} ::: *

popd > /dev/null

