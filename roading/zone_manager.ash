// new module header
#define MAX_ZONES 64
#define MAX_OBJ_PER_ZONE 512
#define MAX_OBJ_ALL_ZONES 32768

#define ZM_MAX_WORLD_OBJ 2048

// can't change
#define MAX_ACTIVE_ZONES 9
#define MAX_VICINITY_ZONES 16

struct ZoneManager {
  int CurrentX;
  int CurrentY;
  
  int PreviousX;
  int PreviousY;
  
  int WorldWidth;
  int WorldHeight;
  
  int ZoneXYCount;
  
  /// Reset the zones for all objects. This can be expensive, so don't do too often.
  import void RefreshObjectZones();
  
  /// Gets the zone ID for a X,Z World position
  import int GetZoneID_FromObjPos(float x, float z);
  /// Updates the current main zone in the Zone Manager. Automatically Refresh Object Zones as needed and adjust active zones. ZoneChanged is set to true when a zone change occurs.
  import void UpdateCurrentPos(float x, float z);
  /// Is set to true when a zone change just occured (in UpdateCurrentPos), false otherwise.
  writeprotected bool ZoneChanged;
  
  /// Creates and adds an object to the ZoneManager
  import Mode7Object* AddObject(int x, int z, float factor, int graphic);
  
  /// Holds the objects
  Mode7Object* Objects [ZM_MAX_WORLD_OBJ];
  writeprotected int ObjectCount;
  
  /// Call before starting a GetNextObjectActiveZones sequence
  import void ResetObjectActiveZones();
  /// Returns the next object from all active zones, or null if it has iterated through all objects. Call ResetObjectActiveZones if you want to iterate again.
  import Mode7Object* GetNextObjectActiveZones();
  
  protected int _iZone;  
  protected int _iZoneObject;
  
  /// Set a specific zone to iterate through all objects from it. Use current main zone if a negative value is passed.
  import void ResetObjectIteratingZone();
  /// Returns the next object from the set iterating zone, or null if no object left. Call ResetObjectIteratingZone if you want to iterate again.
  import Mode7Object* GetNextObjectIteratingZone();
  
  protected int _IteratingZone;
  protected int _iObjectIteratingZone;
  
  
  /// Call before starting a GetNextObjectVicinityZones sequence
  import void ResetObjectVicinityZones();
  /// Returns the next object from all vicinity zones, or null if it has iterated through all objects. Call ResetObjectVicinityZones if you want to iterate again.
  import Mode7Object* GetNextObjectVicinityZones();
  
  protected int _iVicZone;  
  protected int _iVicZoneObject;
  
  
  import protected void _AddObjectToZone(Mode7Object* m7obj, int obj_id);
  writeprotected int ZoneObjectCount[MAX_ZONES];
  writeprotected int ZoneObject[MAX_OBJ_ALL_ZONES];   
  
  import protected void _AdjustActiveZones();
  protected int _ActiveZones[MAX_ACTIVE_ZONES];
  
  import protected void _AdjustVicinityZones();
  protected int _VicinityZones[MAX_VICINITY_ZONES];
  protected int _VicinityZoneCount;
};