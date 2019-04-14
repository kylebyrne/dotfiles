alias gp="git push"

function gca
  git add .
  read --prompt "echo 'Message: ' " -l commit_msg
  git commit -m $commit_msg
end

function g
    git
end

__breeze_variables

function __git_add -a var
    set toplevel (git rev-parse --show-toplevel)

    # is numeric
    if [ "$var" -eq "$var" ] 2>/dev/null
        # number
        set myarg $arr[$var]

        # -- (hyphen hyphen) compare
        set hyphen (printf "%b" (printf '%s%x' '\x' 45))
        if [ "$myarg" = "$hyphen$hyphen" ] 2>/dev/null
            set myarg './'$myarg
        end

        git add $toplevel/$myarg
    else
        # not a number
        git add $toplevel/$var
    end
end

function __ga
    # number
    set res (string split "-" -- (string trim $argv))
    set first $res[1]
    set length (count $res)
    set last ""

    # >
    if [ $length -gt 1 ]
        set last $res[2]
    # >
    else
        # just one
        __git_add $res
        return
    end

    # last exists
    if [ $last != '' ]
        set arr_length (count $arr)

        # clamp as array length
        if [ $arr_length -lt $last ]
          set last $arr_length
        end

        # first < last
        if [ $first -lt $last ]
          for i in (seq $first 1 $last)
              __git_add $i
          end
        else
          echo 'Argument is not valid.'
        end
    else
        __git_add $first
    end
end

function ga
    # space like, `ga 1 2 3`
    set res (string split " " -- (string trim $argv))
    set length (count $res)

    # only one
    if [ $length -eq 0 ]
        __ga $argv
        return
    end

    for i in $res
        #echo $i
        __ga $i
    end
end

function __git_branch -a var
    # is numeric
    if [ "$var" -eq "$var" ] 2>/dev/null
        # number
        set myarg $arr[$var]

        # -- (hyphen hyphen) compare
        set hyphen (printf "%b" (printf '%s%x' '\x' 45))
        if [ "$myarg" = "$hyphen$hyphen" ] 2>/dev/null
            set myarg './'$myarg
        end
        git branch $op $myarg
    else
        # not a number
        git branch $op $var
    end
end

function __gb
    # number
    # $argv[1] $argv[2..(count $argv)]
    set res (string split "-" -- (string trim $argv))
    set first $res[1]
    set length (count $res)
    set last ""

    # >
    if [ $length -gt 1 ]
        set last $res[2]
    # >
    else
        # just one
        __git_branch $argv
        return
    end

    # last exists
    if [ $last != '' ]
        set arr_length (count $arr)

        # clamp as array length
        if [ $arr_length -lt $last ]
          set last $arr_length
        end

        # first < last
        if [ $first -lt $last ]
          for i in (seq $first 1 $last)
              __git_branch $i
          end
        else
          echo 'Argument is not valid.'
        end
    else
        git branch $argv[1] $first
    end
end

function gb
    set op ""
    set length (count $argv)

    # >= 2
    if [ $length -ge 2 ]
        # more than 1
        set fst (echo $argv[1] | string sub -l 1)
        # if first string is -, it is option
        if [ $fst = '-' ]
            # option ex:-D
            set op $argv[1]
            set args $argv[2..(count $argv)]
            __gb $args
            return
        end
    end

    set check_count (git branch)
    set length (count $check_count)
        if [ $length -gt 1 ]
        # reset
        set arr ""
    end

    # increment
    set i 0

    for item in (git branch)
        #increment
        set i (math $i + 1)

        # check * contain
        set res (string split " " -- (string trim $item))
        set length (count $res)
        # >
        set is_contain true
        set name ""
        # more than one
        if [ $length -gt 1 ]
            # with *
            set name (string trim $res[2])
        else #only one
            set name (string trim $item)
        end

        set arr[$i] $name

        # *
        if [ $length -gt 1 ]
            # text without new line
            echo -ne '* '
        else
            # just blank
            echo -ne '  '
        end

        # text without new line
        echo -ne [$i]' '
        set_color green
        echo $name
        set_color normal
    end
end

function __git_checkout -a var
    # is numeric
    if [ "$var" -eq "$var" ] 2>/dev/null
        # number
        set length (count $arr)

        if [ $var -gt $length ]
            echo 'Number is large.'
            return
        end

        set toplevel (git rev-parse --show-toplevel)
        set myarg $arr[$var]
        git checkout $myarg
        # to allow gco from subdirs, use:
        # git checkout $toplevel/$myarg
    else
        # not a number
        git checkout $var
    end
end

function __gco
    # number
    set res (string split "-" -- (string trim $argv))
    # for branch names with hyphens, use:
    set res (string trim $argv)
    set first $res[1]
    set length (count $res)
    set last ""

    # >
    if [ $length -gt 1 ]
        set last $res[2]
    else
        # just one
        #set myarg $arr[$res]
        #git checkout $myarg
        __git_checkout $res
        return
    end

    # last exists
    if [ $last != '' ]
        # first < last
        if [ $first -lt $last ]
          for i in (seq $first 1 $last)
              __git_checkout $i
          end
        else
          echo 'Argument is not valid.'
        end
    else
        __git_checkout $first
    end
end

function gco
    # TODO: space like, `gco 1 2 3`
    set length (count $argv)

    if [ $length -eq 2 ]
        # more than 1
        set fst (echo $argv[1] | string sub -l 1)
        # if first string is -, it is option
        if [ $fst = '-' ]
            git checkout $argv
            return
        end
    end

    set res (string split " " -- (string trim $argv))
    for i in $res
        #echo $i
        __gco $i
    end
end

function __gd
    # number
    set res (string split "-" -- (string trim $argv))
    set first $res[1]
    set length (count $res)
    set last ""
    set toplevel (git rev-parse --show-toplevel)

    # >
    if [ $length -gt 1 ]
        set last $res[2]
    else
        # just one
        echo $arr
        set myarg $arr[$res]
        echo $myarg
        git diff $toplevel/$myarg
        return
    end

    # first < last
    if [ $last != '' ]
        if [ $first -lt $last ]
           set arr_length (count $arr)

           # clamp as array length
           if [ $arr_length -lt $last ]
             set last $arr_length
           end

           #for i in (seq $first 1 $last)
           for i in $res
               set myarg $arr[$i]
               git diff $toplevel/$myarg
           end
        else
            echo 'Argument is not valid.'
        end
    else
        set myarg $arr[$first]
        git diff $toplevel/$myarg
    end
    #echo $res[1]end
end

function gd
    # Deal with arguments one-by-one
    for i in $argv
        __gd $i
    end
end

function __gs
  set porcelain_res (git status --porcelain)
  set length (count $porcelain_res)

  if [ $length -gt 0 ]
    # reset
    set arr ""
    set first_msg (git status)
    for branch_name in (git status)
      #echo '# ' $branch_name
      set_color black
      echo -n '# '
      set_color normal
      echo -n 'On branch: '
      set_color --bold white
      echo $branch_name|cut -d ' ' -f3
      set_color normal
      set_color black
      echo '#'
      # set_color normal
      break # only one
    end
  else
    # just normal command
    git status
    return
  end

  # messages
  set git_status1 "Changes to be committed":
  set git_status3 "Changes not staged for commit":
  set git_status4 "Untracked files":
  set git_status5 "Unmerged paths:"

  set arrow "➤ "

  # increment
  set i 0
  # git status --porcelain
  set last_state ""
  set now_state ""

  for item in (git status --porcelain)
    set res (string split " " -- (string trim $item))
    set st $res[1]
    set name $res[2]

    set color_name 'normal'
    set renamed_message ''

    # modify
    if [ $st = 'M' ]
      # modified
      set msg '        modified:'
      # if it is none, it is staged modified.
      if [ $name = '' ]
        # 'M ' commited
        set color_name 'yellow'
        # [caution] 2 white spaces.
        set name (string split "  " -- (string trim $item))[2]
        set now_state $git_status1
      else
        # ' M'
        set color_name 'green'
        set now_state $git_status3
      end

      set i (math $i + 1) #increment
    else if [ $st = 'A' ]
      # added
      set color_name 'yellow'
      set msg '          staged:'
      # [caution] 2 white spaces.
      set name (string split "  " -- (string trim $item))[2]
      set i (math $i + 1) #increment
      set now_state $git_status1
    else if [ $st = '??' ]
      # untracked
      set color_name 'cyan'
      set msg '       untracked:'
      set i (math $i + 1) #increment
      set now_state $git_status4
    else if [ $st = 'D' ]
      # deleted
      set color_name 'red'
      set msg '         deleted:'

      if [ $name = '' ]
        # 'D ' commited
        # [caution] 2 white spaces.
        set name (string split "  " -- (string trim $item))[2]
        set now_state $git_status1
      else
        # ' D'
        set now_state $git_status3
      end

      set i (math $i + 1) #increment
    else if [ $st = 'MM' ]
      # modified and also commited
      set msg '        modified:'
      # if it is none, it is staged modified.
      if [ $name = '' ]
        set color_name 'yellow'
        # [caution] 2 white spaces.
        set name (string split "  " -- (string trim $item))[2]
        set now_state $git_status1
      else
        set color_name 'yellow'
        set now_state $git_status1
      end

      set i (math $i + 1) #increment
    else if [ $st = 'DD' ]
      echo 'TODO: FIX LATER...DD'
    else if [ $st = 'AU' ]
      echo 'TODO: FIX LATER...AU'
    else if [ $st = 'UD' ]
      echo 'TODO: FIX LATER...UD'
    else if [ $st = 'DU' ]
      echo 'TODO: FIX LATER...DU'
    else if [ $st = 'AA' ]
      echo 'TODO: FIX LATER...AA'
    else if [ $st = 'UU' ]
      #echo 'TODO: FIX LATER...UU'
      set msg '        modified:'
      set color_name 'red'
      set now_state $git_status5
      set i (math $i + 1) #increment
    else if [ $st = 'R' ]
      # renamed
      set msg '         renamed:'
      set all_name (string split "  " -- (string trim $item))[2]
      set all_name (string split " -> " -- (string trim $all_name))
      set renamed_message $all_name[1]'-> '
      set name $all_name[2]
      #set color_name 'magenta' like purple
      set color_name 'green'
      set now_state $git_status1
      set i (math $i + 1) #increment
    else if [ $st = 'C' ]
      echo 'TODO: FIX LATER...'
    else
      # TODO: add other status
      # just echo until add
      echo $item
      set color_name 'normal'
      echo 'TODO: UNKNOWN. FIX LATER...'
      continue
    end

    # first message
    if [ $last_state != $now_state ]
      echo '#'
      set_color $color_name
      echo -n $arrow
      set_color 'normal'
      echo $now_state
      set_color $color_name
      echo '#'
    end

    set last_state $now_state

    # push array
    set arr[$i] $name
    set_color $color_name
    echo -ne '#'$msg '' # text without new line
    set_color normal
    echo -ne [$i]' ' # text without new line
    set_color $color_name
    echo $renamed_message$name
  end
  echo '#'
  set_color normal
end

function gs
    set res (git rev-parse --is-inside-work-tree)
    if [ $res = 'true' ]
        # git status
        __gs
    else
        echo 'fatal: Not a git repository (or any of the parent directories): .git'
    end
end
