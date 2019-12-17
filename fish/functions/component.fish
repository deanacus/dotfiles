function component -a componentName -d "Scaffold a new React Component in the current directory"
  set -l templatePath $HOME'/dotfiles/templates/ReactComponent'
  set -l templateFiles (ls $HOME'/dotfiles/templates/ReactComponent/');

  if test -z $componentName
    echo "Please provide a component name";
    return 1
  end

  if test -d $PWD/$componentName
    echo 'folder exists';

    # test 1 -eq $status && echo 'Cool' && return 1
    # test 0 -eq $status && rm -r $PWD/$componentName/*
  else
    mkdir $componentName
  end

  for file in $templateFiles
    set outputFile (echo $PWD/$componentName/$file'.js' | sed "s/test/$componentName.test/g" | sed "s/component/$componentName/g")
    cat $templatePath/$file | sed "s/%%Component%%/$componentName/g" > $outputFile
    set -e outputFile
  end

  set -e templatePath
  set -e templateFiles

end