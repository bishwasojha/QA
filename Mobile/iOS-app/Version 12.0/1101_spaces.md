###  Spaces (oCIS)

**Server**: 2.0.0beta8<br>
**Devices**: iPhoneXR v16

---
 
| Test Case | Description | Expected | Result | Comments |
| :-------- | :---------- | :------- | :----: | :------- |
|**Spaces detection**||
| oC10 server | Authenticate in a oC10 server | Straigth to the list of files | P m16  |  |  |
| No spaces| Authenticate in a oCIS server account with no spaces available | Straigth to the list of files | F m16 | Shows first the list. Straightforward to the files? |  |
| Spaces available | Authenticate in a oCIS server account with spaces available (created remotely)| Personal and spaces are listed (check with server) | P m16 |  |  |
|**Spaces list (local)**| In a local authenticated oCIS session|
| Create new space | Create new space with title | Space is created with correct title (check in server) | NA |  |  |
| Create many spaces | Create many spaces with title that covers all the screen | Spaces are created with correct title (check in server). List correctly displayed | NA |  |  |
| Rename space | Rename an existing space | Space is renamed correctly (check in server) | NA |  |  |
| Change description viewer | 1. Share an space with a user, granting only viewer permission<br>2. Create a text file in the space<br>3. In the new member account, select the text file to set as space description | Not posible, no permissions granted | NA |  |  |
| Change description editor | 1. Share an space with a user, granting editor permission<br>2. Create a text file in the space<br>3. In the new member account, select the text file to set as space description | Permission changes to the content of the file | NA |  |  |
| Change description manager | 1. Share an space with a user, granting manager permission<br>2. Create a text file in the space<br>3. In the new member account, select the text file to set as space description | Permission changes to the content of the file | NA |  |  |
| Add subtitle | 1. Create space without subtitle<br>2. Edit the space to add a subtitle | Subtitle is displayed below the title (check also in server) |  NA|  |  |
| Edit subtitle | 1. Create space without subtitle<br>2. Edit the space to add a subtitle<br>3. Change subtitle, adding a very long one (exceeding screen size) | New subtitle correctly displayed (check also in server) | NA |  |  |
| Add image | 1. Create space without image<br>2. Edit the space to add a image | Image is displayed by clicking on the space name, in the top side of the files view (check also in server) | NA |  |  |
| Edit image | 1. Create space without image<br>2. Edit the space to add a image<br>3. Replace the image for another one | Last image is displayed by clicking on the space name, in the top side of the files view (check also in server) | NA |  |  |
| Change quota | 1. Create space<br>2. Edit the quota, from 1GB to 5GB<br>3. Upload a 2GB file<br>4. Upload a 6GB file | 2. Check in server that the quota was correctly edited<br>3. Upload succeeded<br>4. Upload fails | NA |  |  |
| Disable space | 1. Create a new space<br>2. Upload some files or create folders inside<br>3. Disable the space<br>4. Enter in the space | Content is not available and thumbnail not visible (check also in server) | NA |  |  |
| Remove space option availability | 1. Open the list of options of an available and enabled space<br>2. Disable the space | 1. Remove option is not available<br>2. Remove option is available | NA |  |  |
| Enable space | Over a disabled space, open the list of options and select "Enable"| Content is available and thumbnail visible (check also in server)  | NA |  |  |
| Remove space | 1. Disable an existing space<br>2. Remove the space | Space removed and no longer listed (check also in server) | NA |  |  |
| Remove all spaces | 1. Disable all existing spaces<br>2. Remove all spaces | Spaces removed and no longer listed (check also in server) | NA |  |  |
|**Spaces list (remote)**| In a remote authenticated oCIS session|
| Create new space | Using web, create new space with title | Space is listed in app |P m16  |  |  |
| Create many spaces | Using web, create many spaces with title that covers all the app screen | Spaces are created with correct title. List correctly displayed in both orientations in app | P m16 |  |  |
| Rename space | Using web, rename an existing space | Space is renamed correctly in app | P m16 |  |  |
| Change description | 1. In web, share an space with a user, granting editor permission<br>2. In web, create a text file in the space<br>3. In web, in the new member account, select the text file to set as space description | In app, title changes | P m16 |  |  |
| Add subtitle | 1. Using web, create space without subtitle<br>2. In web, edit the space to add a subtitle | 1. Check that space is created without subtitle in app<br>2. Subtitle added in app | P m16 |  |  |
| Edit subtitle | 1. Using web, create space without subtitle<br>2. In web, edit the space to add a subtitle<br>3. In web, change subtitle, adding a very long one (exceeding screen size) | 1. Check that space is created without subtitle in app<br>2. Subtitle added in app<br>3. Subtitle changed in app | P m16 |  |  |
| Add image | 1. Using web, create space without image<br>2. In web, edit the space to add a image | 1. In app, check that space is created without image<br>2. Image is displayed in app by clicking on the space name, in the top side of the files view | P m16 |  |  |
| Edit image | 1. Using web, create space without image<br>2. In web, edit the space to add a image<br>3. In web, replace the image for another one |  1. In app, check that space is created without image<br>2. Image is displayed in app by clicking on the space name, in the top side of the files view<br>3. Last image is displayed in app by clicking on the space name, in the top side of the files view (check also in server) | P m16 | sometimes, with many spaces, image repeated. Put an eye here |  |
| Change quota | 1. Using web, create space<br>2. In web, edit the quota, from 1GB to 5GB| Check in app that the quota was correctly edited | NA |  |  |
| Disable space | 1. Using web, create a new space<br>2. Upload some files or create folders inside<br>3. In web, disable the space<br>4. In app, enter in the space | 3. In app, space is marked as disabled<br>4. In app, space is not available | F m16 | Space browsable |  |
| Enable space | 1. Using web, over a disabled space, open the list of options and select "Enable"<br>2. In app, open space | Content is available (check also in server) and thumbnail visible | P m16 |  |  |
| Remove space | 1. Using web, disable an existing space<br>2. In web, remove the space | In app, space removed and no longer listed | P m16 |  |  |
| Remove all spaces | 1. Using web, disable all existing spaces<br>2. Remove all spaces | Spaces removed and no longer listed  | P m16 |  |  |
| Remove space from inside | 1. In app, enter in an existing space<br>2. Using web, disable an existing space<br>3. In web, remove the space | In app, error when any action is done over the removed space | F m16 | Not friendly error|  |
|**Spaces file operations (local)**| 
| Create folder root | Create a new folder with special characters in spaces' root by using the '+' button on the top | Folder created in spaces (check in server) | P m15 |  |  |
| Create folder non-root | Create a new folder with special characters in spaces' not root by using the '+' button on the top | Folder created in spaces (check in server) |P m15   |  |  |
| Upload file root | Upload a new file in spaces' root by using the '+' button on the top | File created in root (check in server) | P m15 |  |  |
| Upload file non-root | Upload 30 files in spaces' not root by using the '+' button on the top | File created in non-root (check in server) |  P m15|  |  |
| Upload several files root | Upload 30 files in spaces' root by using the '+' button on the top | File created in spaces (check in server) | P m15 |  |  |
| Upload several file non-root | Upload a new file in spaces' not root by using the '+' button on the top | File created in spaces (check in server) |  P m15|  |  |
| Upload from gallery root | Upload a pic or video from gallery in spaces' root by using the '+' button on the top | File created in spaces (check in server) | P m15 |  |  |
| Upload from gallery non-root | Upload a pic or video from gallery in spaces' not root by using the '+' button on the top | File created in spaces (check in server) | P m15 |  |  |
| Upload several from gallery root | Upload 30 pics or videos from gallery in spaces' root by using the '+' button on the top | File created in spaces (check in server) | P m15 |  |  |
| Upload several from gallery non-root | Upload 30 pics or videos from gallery in spaces' not root by using the '+' button on the top | File created in spaces (check in server) | P m15 |  |  |
| Take photo root | In root folder, take a picture from camera by using the option in '+' button on the top  | Picture uploaded (check in server) | P m15  |  |  |
| Take photo non-root | In non-root folder, take a picture from camera by using the option in '+' button on the top  | Picture uploaded (check in server) | P m15  |  |  |
| Take video root | In root folder, take a video from camera by using the option in '+' button on the top  | Video uploaded (check in server) | P m15  |  |  |
| Take video non-root | In non-root folder, take a video from camera by using the option in '+' button on the top  | Video uploaded (check in server) | P m15  |  |  |
| Scan document root | In root folder, scan a new document by using the option in '+' button on the top | Document uploaded (check in server) |  |  |  |
| Scan document non-root | In non-root folder, scan a new document by using the option in '+' button on the top | Document uploaded (check in server) |  |  |  |
| Open in | Select any file of the spaces list to "Open In" | File opened in external app |  |  |  |
| Move file| 1. Select any file of the spaces list to "Move"<br>2. Select target folder in the space | File moved to the target inside the space (check in server) | NA |  |  |
| Move folder| 1. Select any folder with subfolders of the spaces list to "Move"<br>2. Select target folder in the space | Folder and its content moved to the target inside the space (check in server) | NA |  |  |
| Move to same place| 1. Select any item of the spaces list to "Move"<br>2. Select as target folder in the space the current container folder | Error,not posible | NA |  |  |
| Copy file| 1. Select any file of the spaces list to "Copy"<br>2. Select target folder in the space | File copied to the target inside the space (check in server) | NA |  |  |
| Copy folder| 1. Select any folder with subfolders of the spaces list to "Copy"<br>2. Select target folder in the space | Folder and its content copied to the target inside the space (check in server) | NA |  |  |
| Copy to same place| 1. Select any item of the spaces list to "Copy"<br>2. Select as target folder in the space the current container folder | Error, not posible | NA |  |  |
| Rename | 1. Select any item of the spaces list to "Rename"<br>2. Enter same name<br>3. Enter different name | 2. Error<br>3. Item correctly renamed (check in server) | P m15 |  |  |
| Duplicate file | Select any file of the spaces list to "Duplicate" | Item correctly duplicated in the same location (check in server) | P m15 |  |  |
| Duplicate folder | Select any folder with subfolders of the spaces list to "Duplicate" | Folder and subfolders correctly duplicated in the same location (check in server) | P m15 |  |  |
| Cut/Paste file | 1.Select any file of the spaces list to "Cut"<br>2. Select as target folder to paste, the current container folder<br>3. Select as target folder to paste, another container folder| 2. Error, no posible<br>3. File correctly pasted (check in server) | P m15 |  |  |
| Cut/Paste folder | 1.Select any folder with subfolders of the spaces list to "Cut"<br>2. Select as target folder to paste, the current container folder<br>3. Select as target folder to paste, another container folder| 2. Error, no posible<br>3. Folder and subfolders correctly pasted (check in server) | P m15 |  |  |
| Delete file | 1. Select any file of the spaces list to "Delete"| File correctly deleted (check in server) | P m15 |  |  |
| Delete folder | 1. Select any folder with subfolders of the spaces list to "Delete"| Folder and subfolders correctly deleted (check in server) | P m15 |  |  |
| Delete by swipe | 1. Select any item of the spaces list to "Delete", using the swipe action in the row| Item correctly deleted (check in server) | P m15  |  |  |
| Av. offline file | 1. Select any file of the spaces list to "Available offline" | File correctly av.offline.<br>Check that file appears in "Quick access" as av. offline<br> Check tha file is open and accesible in offline| P m15  |  |  |
| Av. offline folder | 1. Select any folder of the spaces list to "Available offline" | Folder correctly av.offline.<br>Check that folder appears in "Quick access" as av. offline<br> Check that folder is open and accesible in offline| P m15  |  |  |
|**Spaces file operations (remote)**| 
| Create folder root | In web, create a new folder with special characters in spaces' root  | Folder listed in app | P m15 |  |  |
| Create folder non-root | In web, create a new folder with special characters in spaces' not root  | Folder listed in app | P m15  |  |  |
| Upload file root | In web, upload a new file in spaces' root | File listed in app |P m15  |  |  |
| Upload file non-root | In web, upload 30 files in spaces' not root | Files listed in app | P m15 |  |  |
| Upload several files root | In web, upload 30 files in spaces' root | Files listed in app |  P m15|  |  |
| Upload several file non-root | In web, upload a new file in spaces' not root | Files listed in app | P m15 |  |  |
| Move file| 1. In web, select any file of the spaces list to "Move"<br>2. Select target folder in the space | File listed in the target inside the space in the app | NA |  |  |
| Move folder| 1. In web, select any folder with subfolders of the spaces list to "Move"<br>2. Select target folder in the space | Folder and its content listed in the target inside the space in the app | NA |  |  |
| Rename | 1. In web, select any item of the spaces list to "Rename"<br>2. Enter different name | Item correctly listed with new name in app| P m15 |  |  |
| Delete file | 1. In web, select any file of the spaces list to "Delete"| File correctly deleted in app | P m15 |  |  |
| Delete folder | 1. In web, select any folder with subfolders of the spaces list to "Delete" | Folder and subfolders correctly deleted in app | P m15 |  |  |
|**iOS Files app**| 
| Only personal  | 1. Log in a account with no spaces<br>2. Open Files App | Straight to the list of files | P m15 |  |
| With spaces | 1. Log in a account with some spaces<br>2. Open Files App | After selecting the account, the list of spaces is there to browse through | P m15 |  |
| Browse spaces | 1. Log in a account with some spaces<br>2. Open Files App | After selecting the account, the list of spaces is there to browse through |  |  |
| Create folder root | Create a new folder with special characters in spaces' root  | Folder created in spaces (check in server) |  |  |  |
| Create folder non-root | Create a new folder with special characters in spaces' not root | Folder created in spaces (check in server) |  |  |  |
| Copy to root| 1. Select a diferent provider and copy some files and folders from there<br>2. Paste into an space in its root folder | Content correctly copied, check in server |  |  |  |
| Copy to non-root| 1. Select a diferent provider and copy some files and folders from there<2. Paste into an space in any non-root folder | Content correctly copied, check in server |  |  |  |
| Move file| 1. Select any file of the spaces list to "Move"<br>2. Select target folder in the space | File moved to the target inside the space (check in server) |  |  |  |
| Move folder| 1. Select any folder with subfolders of the spaces list to "Move"<br>2. Select target folder in the space | Folder and its content moved to the target inside the space (check in server) |  |  |  |
| Move to same place| 1. Select any item of the spaces list to "Move"<br>2. Select as target folder in the space the current container folder | Error,not posible |  |  |  |
| Copy file| 1. Select any file of the spaces list to "Copy"<br>2. Select target folder in the space | File copied to the target inside the space (check in server) |  |  |  |
| Copy folder| 1. Select any folder with subfolders of the spaces list to "Copy"<br>2. Select target folder in the space | Folder and its content copied to the target inside the space (check in server) |  |  |  |
| Copy to same place| 1. Select any item of the spaces list to "Copy"<br>2. Select as target folder in the space the current container folder | Error, not posible |  |  |  |
| Rename | 1. Select any item of the spaces list to "Rename"<br>2. Enter same name<br>3. Enter different name | 2. Error<br>3. Item correctly renamed (check in server) |  |  |  |
| Duplicate file | Select any file of the spaces list to "Duplicate" | Item correctly duplicated in the same location (check in server) |  |  |  |
| Duplicate folder | Select any folder with subfolders of the spaces list to "Duplicate" | Folder and subfolders correctly duplicated in the same location (check in server) |  |  |  |
| Share with user as viewer | Share any item with user as viewer | Check with the recipient user that can view and preview the content and the item is shared in app and web | 
| Share by link | Share any item by link | Check that the link works fine and the item is shared by link in app and web | 
|**Spaces sharing and membering (remote)**| 
| Add member as viewer | In web, add another user as viewer to the space| In app, check with the recipient user that can view and preview the content | NA
| Add member as editor | In web, add another user as editor to the space| In app, check with the recipient user that can perform any operation but sharing (upload, edit, delete) | NA
| Add member as manager | In web, add another user as manager to the space| In app, check with the recipient user that can perform any operation (upload, edit, delete, share)| NA
| Change member's role | 1. In web, change the rol of a viewer user to editor<br>2. Change the rol of the editor to manager<br>3. Change the rol of the manager to viewer| 1. In app, new options to add content are now available, but not sharing options<br>2. In app, sharing options are now available<br>3. In app, no sharing, no upload options available. | NA
| Remove member | In web, remove an existing member from the space | In app, check with the recipient user that can not access the space anymore | NA
| Disable user | In web, disable from server a user that is member of a space | In app, check with the user is not allowed to do operations over the space | NA
| Remove user | In web, remove from server a user that is member of a space | In app, check with the user is not member anymore anymore | NA
|**Spaces sharing and membering (local)**| 
| Add member as viewer | Add another user as viewer to the space| Check with the recipient user that can view and preview the content | NA
| Add member as editor | Add another user as editor to the space| Check with the recipient user that can perform any operation but sharing (upload, edit, delete) | NA
| Add member as manager | Add another user as manager to the space| Check with the recipient user that can perform any operation (upload, edit, delete, share)| NA
| Change member's role | 1. Change the rol of a viewer user to editor<br>2. Change the rol of the editor to manager<br>3. Change the rol of the manager to viewer| 1. New options to add content are now available, but not sharing options<br>2. Sharing options are now available<br>3. No sharing, no upload options available. | NA
| Remove member | Remove an existing member from the space | Check with the recipient user that can not access the space anymore | NA
| Disable user | Disable from server a user that is member of a space | Check with the user is not allowed to do operations over the space | NA
| Remove user | Remove from server a user that is member of a space | Check with the user is not member anymore anymore | NA
|**Spaces share as viewer**| 
| Share file/folder | Open file/folder card | No available | P m15 |  |
| Links | Open file/folder card |   No available | F m15 | Available |
| Favorite | Open file/folder card | No available | F m15 | Error |
| Open In | Open file/folder card | Available | P m15 |  |
| Move | Open file/folder card | No available | P m15 |  |
| Rename | Open file/folder card |No available | P m15 |  |
| Duplicate | Open file/folder card |  No available | P m15 |  |
| Copy | Open file/folder card | Available | NA |  |
| Available Offline | Open file/folder card | Available | P m15 |  |
| Cut | Open file/folder card | No available | F m15 | Available  |
| Delete | Open file/folder card | No available | P m15 |  |
| Upload file | Open "+" menu | No available | P m15 |  |
| Create folder | Open "+" menu | No available | P m15 |  |
| Upload from photo library | Open "+" menu | No available | P m15 |  |
| Take photo or video | Open "+" menu | No available | P m15 |  |
| Scan document | Open "+" menu | No available | P m15 |  |
| Download and preview | Click on any previewable file (txt, image...)| File correctly previewed | P m15 |  |
|**Spaces share as editor**| 
| Share file/folder | Open file/folder card |No available | P m15 |  |
| Links | Open file/folder card |  No available | F m15 |  |
| Favorite | Open file/folder card | Available |P m15  |  |
| Open In | Open file/folder card | Available | P m15 |  |
| Move | Open file/folder card | Available | P m15 |  |
| Rename | Open file/folder card |Available | P m15 |  |
| Duplicate | Open file/folder card |  Available| P m15 |  |
| Copy | Open file/folder card | Available | P m15 |  |
| Available Offline | Open file/folder card | Available | P m15 |  |
| Cut | Open file/folder card | Available | P m15 |  |
| Delete | Open file/folder card | Available | P m15 |  |
| Upload file | Open "+" menu | Available |P m15  |  |
| Create folder | Open "+" menu | Available |  P m15|  |
| Upload from photo library | Open "+" menu | Available | P m15 |  |
| Take photo or video | Open "+" menu | Available | P m15 |  |
| Scan document | Open "+" menu | Available | P m15 |  |
| Download and preview | Click on any previewable file (txt, image...)| File correctly previewed | P m15 |  |
|**Spaces share as manager**| 
| Share file/folder | Open file/folder card |Available | P m15 |  |
| Links | Open file/folder card |  Available | P m15 |  |
| Favorite | Open file/folder card | Available | P m15 |  |
| Open In | Open file/folder card | Available |P m15  |  |
| Move | Open file/folder card | Available | P m15 |  |
| Rename | Open file/folder card |Available | P m15 |  |
| Duplicate | Open file/folder card |  Available| P m15 |  |
| Copy | Open file/folder card | Available | P m15 |  |
| Available Offline | Open file/folder card | Available | P m15 |  |
| Cut | Open file/folder card | Available | P m15 |  |
| Delete | Open file/folder card | Available | P m15 |  |
| Upload file | Open "+" menu | Available |  P m15|  |
| Create folder | Open "+" menu | Available| P m15 |  |
| Upload from photo library | Open "+" menu | Available | P m15 |  |
| Take photo or video | Open "+" menu | Available | P m15 |  |
| Scan document | Open "+" menu | Available |P m15  |  |
| Download and preview | Click on any previewable file (txt, image...)| File correctly previewed | P m15 |  |
|**iPad/Tablet**| 