function hub -a command repository name -d "Performs multiple repository operations on Github. Run hub -h to see usage information"

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
set -g splitStr (string split "/" -- $repository)

if test $splitStr[2]
  set -g user $splitStr[1]
  set -g repo $splitStr[2]
else if test $splitStr[1];
  set -g user deanacus
  set -g repo $splitStr[1]
end

    switch "$command"
        case -a --add
        case -n --new
          echo "Setting up a new respoitory"
        case -g --get
          if test $user
            curl https://api.github.com/repos/$user/$repo \
              -s \
              -H "Authorization: token $githubToken"
          end
        case --delete
          echo "deleting a repository"
        case -h --help
          echo $help
        case \*
          echo $usage
    end
end