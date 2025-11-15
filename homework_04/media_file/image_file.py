from homework_04.media_file.media_file import MediaFile
from PIL import Image
import time

class ImageFile(MediaFile):
    def __init__(self, path):
        super().__init__(path)
        self.image_format = 'jpg'

    def get_info(self):
        return print(f"File: {self.path}, "
                     f"size: {self.size}, "
                     f"owner: {self.owner}, "
                     f"created: {self.created_ts}, "
                     f"updated: {self.updated_ts}, "
                     f"is_deleted: {self.is_deleted}"
                     f"Image format: {self.image_format} ")

    def play(self):
        print(f"Showing image file: {self.path}")
        try:
            img = Image.open(self.path)
            img.show()
            time.sleep(15)
            img.close()
        except Exception as ex:
            print(ex)
