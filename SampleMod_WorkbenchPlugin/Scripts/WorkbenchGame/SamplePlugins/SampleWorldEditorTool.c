[WorkbenchToolAttribute(name: "Sample World Editor Tool", description: "Click on map to create new entity from Prefab Variants array.\nPress Escape to delete all entities created during single session.", wbModules: {"WorldEditor"}, awesomeFontCode: 0xf074)]
class SampleWorldEditorTool: WorldEditorTool
{
	[Attribute("", UIWidgets.ResourceAssignArray, "Pool of prefabs for placement randomizer.", "et")]
	protected ref array<ResourceName> m_PrefabVariants;
	
	[Attribute("0", UIWidgets.CheckBox, "Randomize scale of placed objects.")]
	bool m_RandomScale;
	
	ref DebugTextScreenSpace m_text;
	ref DebugTextScreenSpace m_crossHair;
	ref array<IEntity> m_arrayOfEntities;

	vector m_previousTraceEnd;

	// Delete all button
	[ButtonAttribute("Delete all")]
	void DeleteAll()	
	{
		// Do nothing if array is empty
		if(!m_arrayOfEntities)
			return;
		
		// Delete all entities created by this tool
		m_API.BeginEntityAction("Deleting entities");
		m_API.DeleteEntities(m_arrayOfEntities);
		m_API.EndEntityAction();
		m_arrayOfEntities.Clear();
	}
	
	// Randomize scale button
	[ButtonAttribute("Randomize scale")]
	void RandomizeScale()	
	{
		// Do nothing if array is empty
		if(!m_arrayOfEntities)
			return;
		
		// Delete all entities created by this tool
		m_API.BeginEntityAction("Changing scale of entities");
		foreach (int currentIndex, IEntity entity: m_arrayOfEntities)
		{
			m_API.ModifyEntityKey(entity, "scale", (Math.RandomFloat(0.5,2)).ToString());
		}
		m_API.EndEntityAction();
	}
	
	// Method called on mouse movement
	override void OnMouseMoveEvent(float x, float y)
	{
		vector traceStart;
		vector traceEnd;
		vector traceDir;

		m_crossHair.SetTextColor(ARGBF(1, 1.0, 1.0, 1.0));
		m_text.SetTextColor(ARGBF(1, 1.0, 1.0, 1.0));
		m_crossHair.SetPosition(x - 9, y - 16);
		m_crossHair.SetText("+");
		m_text.SetPosition(x + 15, y);

		if (m_API.TraceWorldPos(x,y, TraceFlags.WORLD, traceStart, traceEnd, traceDir))
		{
			m_text.SetText((traceEnd).ToString() + " cursor position");
		}
		else
		{
			m_crossHair.SetText("");
		}
	}

	// Method called on mouse key press
	override void OnMousePressEvent(float x, float y, WETMouseButtonFlag buttons)
	{
		vector traceStart;
		vector traceEnd;
		vector traceDir;

		if(!m_PrefabVariants)
			return;
		
		if (m_API.TraceWorldPos(x,y, TraceFlags.WORLD, traceStart, traceEnd, traceDir))
		{
			m_previousTraceEnd = traceEnd;
			
			m_API.BeginEntityAction("Processing " + traceEnd);
		
			// Create entity using one of the selected random prefabs
			IEntity entity = m_API.CreateEntity(m_PrefabVariants.GetRandomElement(), "", m_API.GetCurrentEntityLayerId(), null, traceEnd, vector.Zero);
			m_arrayOfEntities.Insert(entity);
			
			if(m_RandomScale)
				m_API.ModifyEntityKey(entity, "scale", (Math.RandomFloat(0.5,2)).ToString());
			
			m_API.EndEntityAction();	
		}
	}
	
	// Method called on mouse key release
	override void OnMouseReleaseEvent (float x, float y, WETMouseButtonFlag buttons) 
	{
		vector traceStart;
		vector traceEnd;
		vector traceDir;
		
		if(m_arrayOfEntities.Count() == 0)
			return;
		
		// Get last modified entity
		IEntity entity = m_arrayOfEntities.Get(m_arrayOfEntities.Count()-1);
		
		// Exit if it was i.e. already deleted
		if(!entity)
			return;
		
		if (m_API.TraceWorldPos(x,y, TraceFlags.WORLD, traceStart, traceEnd, traceDir))
		{
			m_API.BeginEntityAction("Processing " + traceEnd);
		
		
			vector rotationVector;
			rotationVector = vector.Direction(m_previousTraceEnd,traceEnd);
			rotationVector = rotationVector.VectorToAngles();

			// Modify angleY 
			m_API.ModifyEntityKey(entity, "angleY", rotationVector[0].ToString());
			
			// Add to selection list
			m_API.AddToEntitySelection(entity);
						
			m_API.EndEntityAction();	
		}
	}

	// Method called on keyboard key press
	override void OnKeyPressEvent(KeyCode key, bool isAutoRepeat)
	{
		// Remove all previously created entities
		if (key == KeyCode.KC_ESCAPE && isAutoRepeat == false)
		{
			// Remove text
			m_text.SetText("");
			
			DeleteAll();
		}
		
		if (key == KeyCode.KC_C && isAutoRepeat == false)
		{
			m_RandomScale = !m_RandomScale;
			Print(m_RandomScale);
		}
	}

	override void OnActivate()
	{
		m_text = DebugTextScreenSpace.Create(m_API.GetWorld(), "", 0, 100, 100, 14, ARGBF(1, 1, 1, 1), 0x00000000);
		m_crossHair = DebugTextScreenSpace.Create(m_API.GetWorld(), "", 0, 0, 0, 30, ARGBF(1, 1, 1, 1), 0x00000000);
		m_arrayOfEntities = new array<IEntity>;
	}

	override void OnDeActivate()
	{
		m_text = null;
		m_crossHair = null;
		m_arrayOfEntities.Clear();
	}
}