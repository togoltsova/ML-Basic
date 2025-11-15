from homework_04.media_file.image_file import ImageFile
from homework_04.media_file.media_file import MediaFile
from homework_04.media_file.video_file import VideoFile


"""
Для тестирования потребуется установка дополнительных библиотек:
для фото:
pip install Pillow
для видео:
pip install PySide6
pip install python-vlc
"""

def test_media_file(media_file: MediaFile):
    media_file.get_info()
    media_file.play()

# test img
img_file = ImageFile("/Users/togoltsova/dev/otus/ml-basic/repo/ML-Basic/homework_04/test_data/test_photo.jpg")
test_media_file(img_file)

# test video
video_file = VideoFile("/Users/togoltsova/dev/otus/ml-basic/repo/ML-Basic/homework_04/test_data/test_video.mp4")
test_media_file(video_file)
