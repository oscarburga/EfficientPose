from os.path import join
import os

this_path = os.path.dirname(__file__)
folder = 'Imagenes_y_videos'
dir_path = join(this_path, folder)

print('Starting cleanup of dir ' + dir_path)

listed_dir = os.listdir(dir_path)
for file in listed_dir:
    full_path = join(dir_path, file)
    if os.path.isfile(full_path):
        if '_tracked' in file:
            print(f'Deleting file {full_path} because it has "_tracked" in the file name. This could be a previously-processed image or video.')
            os.remove(full_path)

print('Cleanup finished...')