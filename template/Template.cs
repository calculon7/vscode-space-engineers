using System;

// Space Engineers DLLs
using Sandbox.ModAPI.Ingame;
using Sandbox.ModAPI.Interfaces;
using Sandbox.Game.EntityComponents;
using VRageMath;
using VRage.Game;
using VRage.Collections;
using VRage.Game.Components;
using VRage.Game.ObjectBuilders.Definitions;
using VRage.Game.ModAPI.Ingame;
using SpaceEngineers.Game.ModAPI.Ingame;

/*
 * Must be unique per each script project.
 * Prevents collisions of multiple `class Program` declarations.
 */
namespace Template
{

    /*
     * Do not change this declaration because this is the game requirement.
     */
    public sealed class Program : MyGridProgram
    {

        /*
         * Will be used for automatic script export.
         * The code inside this region is the ingame script.
         */
        #region script

        /*
         * The constructor, called only once every session and always before any 
         * other method is called. Use it to initialize your script. 
         *    
         * The constructor is optional and can be removed if not needed.

         * It's recommended to set RuntimeInfo.UpdateFrequency here, which will 
         * allow your script to run itself without a timer block.
         */
        public Program()
        {
            // Runtime.UpdateFrequency = UpdateFrequency.Update1; // run every 16.7ms
            // Runtime.UpdateFrequency = UpdateFrequency.Update10; // run every 166.7ms
            // Runtime.UpdateFrequency = UpdateFrequency.Update100; // run every 1.67s
        }

        /*
         * Called when the program needs to save its state. Use this method to save
         * your state to the Storage field or some other means. 
         * 
         * This method is optional and can be removed if not needed.
         */
        public void Save() { }

        /*
         * The main entry point of the script, invoked every time one of the 
         * programmable block's Run actions are invoked, or the script updates 
         * itself. The updateSource argument describes where the update came from.
         * 
         * The method itself is required, but the arguments above can be removed 
         * if not needed.
         */
        public void Main(string argument, UpdateType updateSource) { }

        #endregion script
    }
}