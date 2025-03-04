export interface Directory {
  folders: Array<Folder>;
  files: Array<File>;
}

export interface Folder {
  origin: string;
  path: string;
  name: string;
  size: string;
}

export interface File {
  origin: string;
  path: string;
  name: string;
  size: string;
  thumbnail: string;
  printTime?: string;
  filamentWeight?: number;
  date?: string;
  successfull: string;
  successfullIcon: string;
}
