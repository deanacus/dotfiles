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

  · -c or --clone <USER/REPONAME>
      Will clone the the Github repository <USER/REPONAME> into the current
      directory. if <USER> is not supplied, the current user is assumed.

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

  function addRepo -a repo
    if test $repo
      curl \
        -X POST \
        -H "Authorization: token $githubToken" \
        -d "{\"name\":\"$repo\"}" \
        https://api.github.com/user/repos
    else
      echo "Repo name required."
    end

    set url (getRepo deanacus $repo | jq '.ssh_url' | sed 's/"//g');

    echo $url

    if test -d $PWD/.git
      set_color green;
      confirm "Set current repo remote to new repo?"
      test 0 -eq $status && git remote add origin $url
      set_color normal;
    else
      set_color green;
      confirm "Initialise new repo in $PWD and add new Github repo as remote?"
      test 0 -eq $status && git init && git remote add origin $url
      set_color normal;
    end

    # Cleaning up after itself
    functions -e addRepo
  end

  function getRepo -a user repo
    curl https://api.github.com/repos/$user/$repo \
      -s \
      -H "Authorization: token $githubToken"

    # Cleaning up after itself
    functions -e getRepo
  end

  function deleteRepo -a user repo
    confirm "Are you really sure you want to delete $user/$repo?"
    if test 0 -eq $status
      curl https://api.github.com/repos/$user/$repo \
      -s \
      -H "Authorization: token $githubToken" \
      -X DELETE
    else
      echo 'Lucky I asked, then, hey?'
    end

    # Cleaning up after itself
    functions -e deleteRepo
  end

  function cloneRepo -a user repo
    set url (getRepo deanacus $repo | jq '.ssh_url' | sed 's/"//g');

    git clone $url

    cd $repo

    if test -e package.json
      set_color green;
      confirm "Install dependencies?"
      test 0 -eq $status && npm i
      set_color normal;
    end

    functions -e cloneRepo
  end

  function setRepoVars -a repository
    if test -z (string split "/" -- $repository)[2]
      set -g user deanacus
      set -g repo (string split "/" -- $repository)[1]
    else
      set -g user (string split "/" -- $repository)[1]
      set -g repo (string split "/" -- $repository)[2]
    end

    # Cleaning up after itself
    functions -e setRepoVars
  end

  switch "$cmd"
    case -a --add -n --new
      addRepo $repository
    case -c --clone
      setRepoVars $repository
      cloneRepo $user $repo
    case -g --get
      setRepoVars $repository
      getRepo $user $repo
    case --delete
      setRepoVars $repository
      deleteRepo $user $repo
      set -e user
      set -e repo
    case -h --help
      echo $help
    case \*
      echo $usage
  end
end