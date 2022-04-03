// new module header

struct ZoneManager {
  int CurrentX;
  int CurrentY;
  
  int PreviousX;
  int PreviousY;
  
  int WorldWidth;
  int WorldHeight;
  
  int ZoneXYCount;
  
  import void UpdateCurrentPos(float x, float z);
  
  import Mode7Object* AddObject(int x, int z, float factor, int graphic);
  
  Mode7Object* Objects [MAX_OBJECTS];
  writeprotected int ObjectCount;
  
  writeprotected bool ZoneChanged;
};