// new module header
#define MAX_ZONES 64
#define MAX_OBJ_PER_ZONE 256
#define MAX_OBJ_ALL_ZONES 16384

// can't change
#define MAX_ACTIVE_ZONES 9

struct ZoneManager {
  int CurrentX;
  int CurrentY;
  
  int PreviousX;
  int PreviousY;
  
  int WorldWidth;
  int WorldHeight;
  
  int ZoneXYCount;
  
  import void RefreshObjectZones();
  
  import int GetZoneID_FromObjPos(float x, float z);
  import void UpdateCurrentPos(float x, float z);
  
  import Mode7Object* AddObject(int x, int z, float factor, int graphic);
  
  Mode7Object* Objects [MAX_OBJECTS];
  writeprotected int ObjectCount;
  
  import protected void _AddObjectToZone(Mode7Object* m7obj, int obj_id);
  writeprotected int ZoneObjectCount[MAX_ZONES];
  writeprotected int ZoneObject[MAX_OBJ_ALL_ZONES];
  
  protected int _iZone;  
  protected int _iZoneObject;
  
  import void ResetObjectActiveZone();
  import Mode7Object* GetNextObjectActiveZone();
  
  writeprotected bool ZoneChanged;
  
  import protected void _AdjustActiveZones();
  protected int _ActiveZones[MAX_ACTIVE_ZONES];
};