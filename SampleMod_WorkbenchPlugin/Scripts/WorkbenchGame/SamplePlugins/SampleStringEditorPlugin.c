[WorkbenchPluginAttribute(name: "Sample String Editor Plugin", category: "Sample Plugins", shortcut: "Ctrl+T", wbModules: {"LocalizationEditor"}, awesomeFontCode: 0xf02d)]
class SampleStringEditorPlugin: LocalizationEditorPlugin
{
	override void Run()
	{
		LocalizationEditor localizationEditor = Workbench.GetModule(LocalizationEditor);
		if (! localizationEditor) return;
		
		array<int> selectedIndexes = new array<int>;
		localizationEditor.GetSelectedRows(selectedIndexes);
		Print(selectedIndexes);
	}
}