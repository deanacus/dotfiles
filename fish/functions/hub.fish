function hub -a cmd repository -d "Performs multiple repository operations on Github. Run hub -h to see usage information"
set -l usage (set_color -o)"hub"(set_color normal)" - perform multiple repository operations on Github

"(set_color -o)"Synopsis:

    "(set_color -o)"hub"(set_color normal)" [ -a | --add | -n | --new ] <REPONAME>
      Creates a new repository on Github for authorized user with name <REPONAME>
    "(set_color -o)"hub"(set_color normal)" [ -g | --get ] <USER/REPONAME>
      Fetches the repository details for <USER>'s repository <REPONAME>
    "(set_color -o)"hub"(set_color normal)" [ --delete ] REPONAME
      Deletes repository <REPONAME> for authorized user
"

set -l help "$usage

"(set_color -o)"Description"(set_color normal)"

  "(set_color -o)"hub"(set_color normal)" provides a minimal interface to Github for repo operations

  The following options are available:

  · -a or --add <REPONAME>
      Will create a new git repository with the name <REPONAME> on Github.com
      for the user that has a valid GITHUB_ACCESS_TOKEN variable.

  · -g --get <USER/REPONAME>
      Will return the JSON object for the Github.com git repository
      <USER/REPONAME>. If <USER> is not supplied, then the current user is
      assumed, otherwise the specified <USER> is queried

  · -n --new is an alias to -a --add

  · --delete <REPONAME>
      Will delete the git repository <REPONAME> from Github.com for the user
      that has a valid GITHUB_ACCESS_TOKEN variable. This option has no
      shortform tag to avoid accidental deletions.

  · -h  or --help
      Will display this help text

"(set_color -o)"Examples"(set_color normal)"

  "(set_color -o)"hub"(set_color normal)" -a test
    Creates repo 'test' for the current user
  "(set_color -o)"hub"(set_color normal)" -g facebook/react
    Returns the JSON values from the Github API for the React repository.
  "(set_color -o)"hub"(set_color normal)" --delete test
    Deletes the repository 'test' for the current user
"
  function addRepo -a repository
    if test $repository
      curl \
        -X POST \
        -H "Authorization: token $githubToken" \
        -d "{\"name\":\"$repository\"}" \
        https://api.github.com/user/repos
      echo 'test'
    else
      echo "Repo name required."
    end

    set url (eval get $repository)

    if test -d $PWD/.git
      set_color green;
      confirm "Set current repo remote to new repo?"
      test 0 -eq $status && git remote add origin $url
      set_color normal;
    else
      set_color green;
      confirm "Initialise new repo in $PWD and add new Github repo as remote?"
      test 0 -eq $status && git remote add origin $url
      set_color normal;
    end
    functions -e addRepo
  end

  function get -a user repo

    curl https://api.github.com/repos/$user/$repo \
      -s \
      -H "Authorization: token $githubToken"
      functions -e get
  end

    switch "$cmd"
        case -a --add -n --new
          eval (addRepo $repository)
        case -g --get
          if test -z (string split "/" -- $repository)[2]
            set -g user deanacus
            set -g repo (string split "/" -- $repository)[1]
          else
            set -g user (string split "/" -- $repository)[1]
            set -g repo (string split "/" -- $repository)[2]
          end
          echo (get $user $repo)
          set -e user
          set -e repo
        case --delete
          echo "deleting a repository"
        case -h --help
          echo $help
        case \*
          echo $usage
    end
end