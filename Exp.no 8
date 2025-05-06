## 8 A Live acquisition of system RAM and store the memory dump for forensic analysis.

🛠️ Tools Used
LiME (Linux Memory Extractor)

dd or memdump (alternative method)
Volatility (for later analysis – optional)

### Steps - CLI Tools
Clone and compile LiME:

git clone https://github.com/504ensicsLabs/LiME
cd LiME/src
make
Insert the kernel module to dump RAM:

sudo insmod lime.ko "path=/home/rahul/ram_dump.lime format=lime"
Check output file:

ls -lh /home/rahul/ram_dump.lime
(Optional) Analyze with Volatility:

volatility -f ram_dump.lime --profile=LinuxUbuntu_20_04x64 pslist

### Also FTK Manager

- Open FTK Imager as Administrator.
- Go to File > Capture Memory.
- In the "Capture Memory" window:
- Set destination path for .mem file (e.g., D:\Forensics\ram_capture.mem)
- (Optional) Check Include pagefile.sys if you want it
- (Optional) Select Create AD1 file for AccessData format
- Click Start – It will acquire and save the memory image.

Verify the Image File:

Note the file size.

Optionally open it in Volatility or FTK Imager for viewing.


## 8 B Live copy of a folder and ensure integrity with hash values.

🛠️ Tools Used
rsync or cp

md5sum / sha256sum

tar or dd for complete archival

## Steps - CLI
Copy folder with rsync while preserving attributes:

sudo rsync -avh --progress /home/rahul/Documents/target_folder/ /mnt/usb/backup_folder/
Create archive (optional):

sudo tar -czvf folder_backup.tar.gz /home/rahul/Documents/target_folder
Generate hash of original and copied data:

find /home/rahul/Documents/target_folder -type f -exec sha256sum {} \; > original_hashes.txt
find /mnt/usb/backup_folder -type f -exec sha256sum {} \; > copied_hashes.txt
Compare the hash files:

diff original_hashes.txt copied_hashes.txt

## Steps - FTK Manager

Open FTK Imager.

Go to File > Create Disk Image.

Select Source Type: Contents of a Folder.

Browse and add the folder (e.g., C:\Users\Rahul\Documents\ProjectX).

Choose destination image type:

Use Raw (.dd) or AD1 (AccessData Custom Container)

Set image destination, name, and case details.

Click Finish → Start to begin acquisition.

Verify hashes:

FTK automatically generates MD5/SHA1 hash of the image.

You can view this in the summary report.
