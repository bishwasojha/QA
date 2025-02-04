#### Move 

#### PRs: 

Devices: <br>
Server: 


---

 
| Test Case | Steps | Expected | Result | Related Comment / Bug link | 
| :-------- | :---- | :------- | :----: | :------------------------- | 
|**Actions**||||||
| Move non-downloaded file  | 1. Select a file to move<br>2. Select a correct target location | File moved to the new location (removed from original location). Check in server|   |  |
| Move downloaded file  | 1. Select a downloaded file to move<br>2. Select a correct target location | File moved to the new location. Check in server and in internal storage the correct location |   |  |
| Move non-downloaded folder | 1. Select a folder that contains subfolders with files inside to move<br>2. Select a correct location | Folder moved to the new location, including all subfolders and content inside (removed from original location). Check in server|  | |
| Move downloaded folder | 1. Select a folder that contains subfolders with files (everything downloaded) inside to move <br>2. Select a correct location | Folder moved to the new location, including all subfolders and content inside. Check the new location in server and internal storage |  | |
| Move to same location | 1. Select an item to move<br>2. Select as location the current location | Item is created with (2) in the name, and in the same location |  |  |
| Move to other location with same name | 1. Select an item to move<br>2. Create in the location folder an item with the same name as the original<br>3. Move | Item is moved with a (2) at the end of the name |  |  |
| Modified | 1. In app, download a txt file<br>2. In server, modify the file<br>3. In app, move the file to another location | Item is moved with the latest downloaded version |  |  |
|**Errors**||||||
| Move item no connection | 1. Remove device connection<br>2. Select an item to move | Correct error message |  |  |
| Move item no server connection | 1. Put server down<br>2. Select an item to move | Correct error message |  |  |
| Maintenance mode | 1. Put server in maintenance mode<br>2. Select an item to move | Correct error message |  |  |
| Move folder to itself | 1. Select a folder to move<br>2. Select as location the folder itself | Not allowed, error message displayed |  |   
| Move folder to a descendant | 1. Select a folder to move<br>2. Select as location a folder inside the original folder | Not allowed, error message displayed |  |   |
| Moved item removed | 1. Select an item to move<br>2. Select a correct location<br>3. Before submitting, remove the original file in webUI or other client | Error message. List of files refreshed without the item |  |  |
