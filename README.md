**GML Development Toolbox** is a collection of independent scripts assisting the development process of applications using GameMaker Language. Most of these scripts are intended to be compatible with the first LTS version of GameMaker, but as this project is transitioning towards next upcoming LTS release, some functions will rely on features from monthly releases of GameMaker.

# Initialization
Individual scripts files can be used in after including raw version of them in a GameMaker project straight from this repository. GameMaker can also package multiple assets into single files that are importable into other projects by performing the following:

1. Clone this repository.
2. Open the project of the cloned repository in GameMaker.
3. In the `Tools` toolbar, open the `Create Local Package` menu.
4. In `Package Details`, fill `Display name` and `Package ID (Filename)` fields with any name, also select `Add All` in the resource selection. Then select `OK`.
5. Select where the package file should be saved on the device.
6. Open the project in GameMaker into which the package will be imported.
7. In the `Tools` toolbar, open the `Import Local Package` menu.
8. Choose the previously saved package file and open it.
9. Choose either individual scripts or `Add All`. Then choose `Import`. The scripts should now be imported and appear in the `Asset Browser`, unless files with the same name already existed in the project, in which case they can be replaced or skipped.
10. Confirm that each individual file was imported successfully.

# Credits
Created and maintained by [Mtax](https://github.com/Mtax-Development).

GameMaker and GameMaker Language are properties of YoYo Games.    
This is a third-party project not affiliated with YoYo Games.
