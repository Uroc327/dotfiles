#!/usr/bin/bash

pushd ~crunge/projects/ > /dev/null

for d in * ; do
	[ -d $d/.git ] || continue
	pushd $d > /dev/null

	branches=()
	eval "$(git for-each-ref --shell --format='branches+=(%(refname))' refs/heads/)"

	show_branches=()

	for b in "${branches[@]}" ; do
		b=${b#refs/heads/}
		[ -n "$(git show-ref origin/$b)" ] || continue

		remote=$(git rev-parse origin/$b)
		last=$(git merge-base $b origin/$b)

		[ $remote != $last ] && show_branches+=($b)
	done

	workdir=
	git diff --exit-code &> /dev/null || workdir=1
	stash=$(git stash list)

	if [ -n "${show_branches[*]}" -o -n "$workdir" -o -n "$stash" ] ; then
		echo -e "\e[32m$d\e[0m:"
		for b in "${show_branches[@]}" ; do
			echo -e "\t- \e[31m$b\e[0m"
		done

		[ -n "$workdir" ] && echo -e "\t- \e[34mWorkdir\e[0m"
		[ -n "$stash" ]   && echo -e "\t- \e[34mStash\e[0m"
	fi

	popd > /dev/null
done

popd > /dev/null

