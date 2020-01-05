function component -a componentName -d "Scaffold a new React Component in the current directory"
  if test -z $componentName
    echo "Please provide a component name";
    return 1
  end

  set -l templatePath $HOME'/dotfiles/templates/ReactComponent'
  set -l templateFiles (ls $HOME'/dotfiles/templates/ReactComponent/');
  set -l destination $PWD'/src/components/'$componentName;

  if test -d $destination
    read -p 'echo "Destination folder exists. Continuing may cause problems with existing files. Continue?"' -l confirmation
    switch $confirmation
      case Y y yes Yes YES
        rm -r $destination/*
      case '' N n no No NO
        echo "Good thing I asked, then, right?!"
        return 1
    end
  else
    mkdir $destination
  end

  for file in $templateFiles
    set outputFile (echo $destination/$file'.js' | sed "s/test/$componentName.test/g" | sed "s/component\.js/$componentName.js/g")
    cat $templatePath/$file | sed "s/%%Component%%/$componentName/g" > $outputFile
    set -e outputFile
  end

  set -e templatePath
  set -e templateFiles

end