from homework_04.media_file.media_file import MediaFile
import PySide6.QtWidgets as QtWidgets
import vlc
import time

class VideoFile(MediaFile):
    def __init__(self, path):
        super().__init__(path)
        self.audio_codec = 'mp3'
        self.video_codec = 'h264'
        self.resolution = (1280, 720)
        self.audio_language = 'English'
        self.subtitle_language = 'English'

    def get_info(self):
        return print(f"File: {self.path}, "
                     f"size: {self.size}, "
                     f"owner: {self.owner}, "
                     f"created: {self.created_ts}, "
                     f"updated: {self.updated_ts}, "
                     f"is_deleted: {self.is_deleted}, "
                     f"Audio codec: {self.audio_codec}, "
                     f"Video codec: {self.video_codec}, "
                     f"Resolution: {self.resolution}, "
                     f"Audio language: {self.audio_language}, "
                     f"Subtitle language: {self.subtitle_language}")

    def play(self):
        print(f"Playing video file: {self.path}")
        try:
            instance = vlc.Instance()
            player = instance.media_player_new()
            media = instance.media_new(self.path)
            player.set_media(media)

            vlc_app = QtWidgets.QApplication([])
            vlc_widget = QtWidgets.QFrame()
            vlc_widget.resize(350, 700)
            vlc_widget.show()

            player.set_nsobject(vlc_widget.winId())
            player.play()
            vlc_app.exec_()
            # wait so the video can be played for 50 seconds
            time.sleep(50)
        except Exception as ex:
            print(ex)