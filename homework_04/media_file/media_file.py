import os
from pwd import getpwuid
from abc import ABC, abstractmethod
from datetime import datetime


class MediaFile(ABC):
    """
    Abstract Base Class for media files.
    """

    def __init__(self, path, size=0, created_ts=None, owner=None):
        self.path = path
        self.created_ts = created_ts
        self.updated_ts = None
        self.owner = owner
        self.is_deleted = False
        if self.is_exist():
            self.size = os.path.getsize(self.path)
            self.created_ts = datetime.fromtimestamp(os.path.getctime(self.path))
            self.owner = getpwuid(os.stat(self.path).st_uid).pw_name

    @abstractmethod
    def play(self):
        """
        Abstract method to play the file.
        """
        pass

    def get_info(self):
        return print(f"File: {self.path}, "
                     f"size: {self.size}, "
                     f"owner: {self.owner}, "
                     f"created: {self.created_ts}, "
                     f"updated: {self.updated_ts}, "
                     f"is_deleted: {self.is_deleted}")

    def create(self):
        if not self.is_exist():
            try:
                file = open(self.path, 'w')
                self.created_ts = datetime.now()
                self.is_deleted = False
                file.close()
                self.size = os.path.getsize(self.path)
                self.created_ts = datetime.fromtimestamp(os.path.getctime(self.path))
                self.owner = getpwuid(os.stat(self.path).st_uid).pw_name
                print(f"File is created: {self.path}")
            except Exception as ex:
                print(ex)

    def update(self, data):
        if self.is_exist() and not self.is_not_deleted():
            self.updated_ts = datetime.now()
            print(f"File is updated: {self.path}")

    def delete(self):
        if self.is_exist():
            print(f"File is deleted: {self.path}")
            self.updated_ts = datetime.now()
            self.is_deleted = True

    def is_exist(self):
        if os.path.exists(self.path):
            return True
        else:
            print(f"File doesn't exist: {self.path}")
            return False

    def is_not_deleted(self):
        if not self.is_deleted:
            return True
        else:
            print(f"File is deleted: {self.path}")
            return False

    def export_as_pdf(self):
        print(f"Exporting as pdf {self.path}")
        pass
