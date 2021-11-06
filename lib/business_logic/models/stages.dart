class Stage {
  int alpha = 84; // horizontal FOV for skydio
  int theta = 56; // vertical FOV
  final int skydio = 1; // change output to skydio format
  int overlapH = 70; // horizontal overlapping
  int overlapV = 70; // vertical overlapping
  int pitch = 0; // camera rotation
  int R; // tower's radius
  int r; // offset from tower
  int objCX = 0; // tower center coordinates (or 0)
  int objCY = 0;
  int objCZ = 0;
  int type = 1;
  int startZ;
  int stopZ;
  // final int H, should be calculated
  Stage(this.R, this.r, this.startZ, this.stopZ);
}

class Stages {
  List<Stage> list = [];
}

class MissionStatus {
  int points = -1;
}
