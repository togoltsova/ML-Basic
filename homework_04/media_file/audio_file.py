from media_file import MediaFile

class AudioFile(MediaFile):

    def __init__(self, path):
        super().__init__(path)
        self.audio_codec = 'mp3'
        self.audio_language = 'English'

    def get_info(self):
        return print(f"File: {self.path}, "
                     f"size: {self.size}, "
                     f"owner: {self.owner}, "
                     f"created: {self.created_ts}, "
                     f"updated: {self.updated_ts}, "
                     f"is_deleted: {self.is_deleted}"
                     f"Audio codec: {self.audio_codec}, "
                     f"Audio language: {self.audio_language}")

    def play(self):
        return print(f"Playing audio file: {self.path}")

    def close(self):
        return print(f"Closing audio file: {self.path}")

