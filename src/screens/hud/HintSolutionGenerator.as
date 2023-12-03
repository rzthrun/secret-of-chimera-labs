package screens.hud
{
	public class HintSolutionGenerator
	{
		private var game:Game;
		public function HintSolutionGenerator(_game:Game)
		{
			game = _game;
		}
		public function GetSolution():String{
			if(game.SavedGame.SavedGameObj.data.CurrentRoomClass != undefined){
				
				return ExteriorSolution();
				
			}else{
				return "No Solution at this time.";
			}
			
		}
		
		private function ExteriorSolution():String{
			if(game.SavedGame.SavedGameObj.data.Exterior != undefined){
				if(game.SavedGame.SavedGameObj.data.Exterior['DoorUnlocked'] == 'Yes'){
					return ManagementDoorSolution();
					//	return FreighterPullerSolutions();
				}else{
					return "In the rear of building, beside the van, is a rainwater drain. " +
						"Remove the cover and pick up the key card. " +
						"Use the key card to open the front entrance." ;
				}
			}else{
				return "In the rear of building, beside the van, is a rainwater drain. " +
					"Remove the cover and pick up the key card. " +
					"Use the key card to open the front entrance." ;
			}
			
		}
		private function ManagementDoorSolution():String{
			if(game.SavedGame.SavedGameObj.data.Lobby != undefined){
				if(game.SavedGame.SavedGameObj.data.Lobby['OfficeDoor'] == 'open'){
					return ComboLockDialSolution();
				}else{
					return "Turn on the computer behind the desk in the main lobby. " +
						"Use the computer's program to set 'MGNT/WORKSHOP' to 'UNLOCKED' by pressing the lock. " +
						"Head back and open the door on the left side of the lobby.";
				}
			}else{
				return "Turn on the computer behind the desk in the main lobby. " +
					"Use the computer's program to set 'MGNT/WORKSHOP' to 'UNLOCKED' by pressing the lock. " +
					"Head back and open the door on the left side of the lobby.";
			}
			
			
		}
		
		private function ComboLockDialSolution():String{
			if(game.SavedGame.SavedGameObj.data.DirLock != undefined){
				if(game.SavedGame.SavedGameObj.data.DirLock['Solved'] == 'Yes'){
					return BathroomDoorSolution();
				}else{
					return "Go to the room with the copy machine and open desk's top left-hand drawer." +
						"Retrieve the brass knob and attach it to the lock on door of the second floor landing." +
						"Use the painting nearby to determine the code to enter. The painting indicates:\n " +
						"Blue(UP), Red(RIGHT), Green(DOWN), Red(RIGHT), Blue(UP), Yellow(END)";
				}
			}else{
				return "Go to the room with the copy machine and open desk's top left-hand drawer." +
					"Retrieve the brass knob and attach it to the lock on door of the second floor landing." +
					"Use the painting nearby to determine the code to enter. The painting indicates:\n" +
					"Blue(UP), Red(RIGHT), Green(DOWN), Red(RIGHT), Blue(UP), Yellow(END)";
			}
			
		}
		
		private function BathroomDoorSolution():String{
			if(game.SavedGame.SavedGameObj.data.OfficeKitchen != undefined){	
				if(game.SavedGame.SavedGameObj.data.OfficeKitchen['Door'] == 'Open'){
					return ProgramSplatControllerSolution();
				}else{
					return "Pick up the paper towels and spray bottle from the custodial cart on the second floor landing. " +
						"Take both to the kitchenette in the second floor office. Use the spray bottle on the slime covered" +
						" door knob. Then use the paper towels to wipe the slime away. Open the door.";
				}
			}else{
				return "Pick up the paper towels and spray bottle from the custodial cart on the second floor landing. " +
					"Take both to the kitchenette in the second floor office. Use the spray bottle on the slime covered" +
					" door knob. Then use the paper towels to wipe the slime away. Open the door.";
			}
			
			
		}
		private function ProgramSplatControllerSolution():String{
			if(game.SavedGame.SavedGameObj.data.OfficeSplatComputer != undefined){
				if(game.SavedGame.SavedGameObj.data.OfficeSplatComputer['SplatProgrammed'] == 'Yes'){
					return BugWireSolution();
				}else{
					return "Pick up the micro-controller from the box on the desk in the first floor copyroom. " +
						"Place the controller on the machine in the left corner of the second floor office bullpen. "+
						"Turn the computer on and set a different symbol for each quadrant under 'MOTOR CONF.' " +
						"For instance & as shown on the paper to the right of the computer, you can use Φ Ω Π Δ going left to right, top to bottom. " +
						"After, go to 'TOGUTECH 300TS' and press install.";
					
				}
			}else{
				return "Pick up the micro-controller from the box on the desk in the first floor copyroom. " +
					"Place the controller on the machine in the left corner of the second floor office bullpen. "+
					"Turn the computer on and set a different symbol for each quadrant under 'MOTOR CONF.' " +
					"For instance & as shown on the paper to the right of the computer, you can use Φ Ω Π Δ going left to right, top to bottom. " +
					"After, go to 'TOGUTECH 300TS' and press install.";
			}
			
			
		}
		
		private function BugWireSolution():String{
			if(game.SavedGame.SavedGameObj.data.OfficeBugWire != undefined){
				if(game.SavedGame.SavedGameObj.data.OfficeBugWire['Solved'] === 'Yes'){
					return CarDoorSolution();
				}else{
					return "Place the micro-controller on spider robot body located on the center desk in the second floor office. " +
						"Look through the magnifying glass and arrange the nodes on the controller so they correspond to positions programmed into the micro-controller. " +
						" Multiple configurations are possible. If  Φ Ω Π Δ (going left to right, top to bottom) is programmed," +
						"the nodes on the controller would need to be arranged: RED (TOP), YELLOW (FIRST DOWN), GREEN (SECOND DOWN), BLUE (BOTTOM).";
				}
			}else{
				return "Place the micro-controller on spider robot body located on the center desk in the second floor office. " +
					"Look through the magnifying glass and arrange the nodes on the controller so they correspond to positions programmed into the micro-controller. " +
					" Multiple configurations are possible. If  Φ Ω Π Δ (going left to right, top to bottom) is programmed," +
					"the nodes on the controller would need to be arranged: RED (TOP), YELLOW (FIRST DOWN), GREEN (SECOND DOWN), BLUE (BOTTOM).";
			}
			
			
			
		}
		
		private function CarDoorSolution():String{
			if(game.SavedGame.SavedGameObj.data.ExteriorRear != undefined){
				if(game.SavedGame.SavedGameObj.data.ExteriorRear['CarFrontUnlocked'] == 'Yes'){
					return VentSolution();
				}else{
					return "Pick up the car keys beside the tool box on the desk in the second floor offices." +
						" Head outside to the back of the building and use the keys to unlock the front cabin of the van."
				}
			}else{
				return "Pick up the car keys beside the tool box on the desk in the second floor offices." +
					" Head outside to the back of the building and use the keys to unlock the front cabin of the van."
			}
			
			
		}
		
		private function VentSolution():String{
			if(game.SavedGame.SavedGameObj.data.Bathroom != undefined){	
				if(game.SavedGame.SavedGameObj.data.Bathroom['VentUnlocked'] == 'Yes'){	
					return SplatSolution();
				}else{
					return "Put the car keys into the van's ignition and tap to turn the van on. " +
						"Open the glove box and pick up the screwdriver. " +
						"Use the screwdriver to open the metal air vent in the second floor bathroom.";
				}
			}else{
				return "Put the car keys into the van's ignition and tap to turn the van on. " +
					"Open the glove box and pick up the screwdriver. " +
					"Use the screwdriver to open the metal air vent in the second floor bathroom.";
			}
			
		}
		
		private function SplatSolution():String{
			if(game.SavedGame.SavedGameObj.data.BathroomDuctExit != undefined){
				if(game.SavedGame.SavedGameObj.data.BathroomDuctExit['GrateUnlocked'] == 'Yes'){
					return ElectricBoxSolution();
				}else{
					return "Go into the air ventilation system through the opening in the bathroom." +
						" On the right-hand side is a vent with a small hole in it. Use the now functioning" +
						" robotic spider on the hole and let it open the vent from the other side.";
				}
			}else{
				return "Go into the air ventilation system through the opening in the bathroom." +
					" On the right-hand side is a vent with a small hole in it. Use the now functioning" +
					" robotic spider on the hole and let it open the vent from the other side.";
			}
			
		}
		private function ElectricBoxSolution():String{
			if(game.SavedGame.SavedGameObj.data.ElectricBoxSmall != undefined){
				if(game.SavedGame.SavedGameObj.data.ElectricBoxSmall['Solved'] == 'Yes'){
					return BigElectricBoxSolution();
				}else{
					return "Open the circuit breaker box to the left of the large computer in the darkened server room." +
						" Align the individual tiles so that all are lit and electricity flows from the bottom to the top."
				}
			}else{
				return "Open the circuit breaker box to the left of the large computer in the darkened server room." +
					" Align the individual tiles so that all are lit and electricity flows from the bottom center to the top center."
			}
			
		}
		private function BigElectricBoxSolution():String{
			if(game.SavedGame.SavedGameObj.data.ElectricBox != undefined){
				if(game.SavedGame.SavedGameObj.data.ElectricBox['Solved'] == 'Yes'){
					return EggplantSolution();
				}else{
					return "Open the circuit breaker box on the right side of the server room." +
						" Align the individual tiles so that all are lit and the electricity flows from the top center," +
						" down to the bottom center.";
				}
			}else{
				return "Open the circuit breaker box on the right side of the server room." +
					" Align the individual tiles so that all are lit and the electricity flows from the top center," +
					" down to the bottom center.";
			}
			
		}
		
		private function EggplantSolution():String{
			if(game.SavedGame.SavedGameObj.data.ServerRoomTable != undefined){	
				if(game.SavedGame.SavedGameObj.data.ServerRoomTable['EggplantAttached'] == 'Yes'){	
					return ShapePuzzleSolution();
				}else{
					return "Pick up the eggplant from the mini-refrigerator in the second floor office kitchenette." +
						" Take the eggplant to the server room and place it on the table with the other objects.";	
				}
			}else{
				return "Pick up the eggplant from the mini-refrigerator in the second floor office kitchenette." +
					" Take the eggplant to the server room and place it on the table with the other objects.";	
			}
			
			
		}
		
		private function ShapePuzzleSolution():String{
			if(game.SavedGame.SavedGameObj.data.BuildingOfficeShapePuzzle != undefined){
				if(game.SavedGame.SavedGameObj.data.BuildingOfficeShapePuzzle['Solved'] == 'Yes'){
					return UnlockElevatorSolution();
				}else{
					return "The heavy metal door in the ground floor office is controlled by the computer in the server room." +
						" The code to unlock door must match computer's video input in both shape (SPHERE, CUBE, CYLINDER) and" +
						" color (ORANGE, RED, PURPLE, BLUE, GREEN). There is no yellow on the door, so place the yellow cylinder on the table" +
						" so it is behind another object from the view-point of the computer. " +
						"The blue ball is a BLUE SPHERE, the red cube is a RED CUBE, the green apple is a GREEN CUBE, the orange is an ORANGE SPHERE, " +
						"and the eggplant is a PURPLE CYLINDER.";
					
					
				}
			}else{
				return "The heavy metal door in the ground floor office is controlled by the computer in the server room." +
					" The code to unlock door must match computer's video input in both shape (SPHERE, CUBE, CYLINDER) and" +
					" color (ORANGE, RED, PURPLE, BLUE, GREEN). There is no yellow on the door, so place the yellow cylinder on the table" +
					" so it is behind another object from the view-point of the computer. " +
					"The blue ball is a BLUE SPHERE, the red cube is a RED CUBE, the green apple is a GREEN CUBE, the orange is an ORANGE SPHERE, " +
					"and the eggplant is a PURPLE CYLINDER.";
			}
			
		}
		
		private function UnlockElevatorSolution():String{
			if(game.SavedGame.SavedGameObj.data.LobbyComputer != undefined){
				if(game.SavedGame.SavedGameObj.data.LobbyComputer['elevator'] == 'Yes'){
					return ElevatorPanelSolution();
				}else{
					return "Use the computer behind the security booth in main lobby." +
						" Select 'ELEVATOR' and set it to 'UNLOCKED'.";
				}
			}else{
				return "Use the computer behind the security booth in main lobby." +
					" Select 'ELEVATOR' and set it to 'UNLOCKED'.";
			}
		}
		
		private function ElevatorPanelSolution():String{
			if(game.SavedGame.SavedGameObj.data.Elevator != undefined){
				if(game.SavedGame.SavedGameObj.data.Elevator['FusePanelUnlocked'] == 'Yes'){
					return GreenFuseSolution();
				}else{
					return "Pick up the Allen wrench from the middle drawer of the desk in the ground floor copy room." +
						" Head to the elevator and use the wrench to open the lower ";
				}
			}else{
				return "Pick up the Allen wrench from the middle drawer of the desk in the ground floor copy room." +
					" Head to the elevator and use the wrench to open the lower ";
			}
			
		}
		
		private function GreenFuseSolution():String{
			if(game.SavedGame.SavedGameObj.data.ElevatorFuse != undefined){
				if(game.SavedGame.SavedGameObj.data.ElevatorFuse['GreenAttached'] == 'Yes'){
					return RedFuseSolution();
				}else{
					return "Pick up the green fuse from the cabinet behind the security desk in the lobby." +
						" Place the green fuse in the appropriate slot in the elevator's circuit box.";
				}
			}else{
				return "Pick up the green fuse from the cabinet behind the security desk in the lobby." +
					" Place the green fuse in the appropriate slot in the elevator's circuit box.";
			}
			
		}
		
		private function RedFuseSolution():String{
			if(game.SavedGame.SavedGameObj.data.ElevatorFuse != undefined){
				if(game.SavedGame.SavedGameObj.data.ElevatorFuse['RedAttached'] == 'Yes'){
					return BlueFuseSolution();
				}else{
					return "Pick up the red fuse from beside the pieces of android on the desk" +
						" in the robotics workshop." +
						" Head to the elevator and place the red fuse within the circuit box.";
				}
			}else{
				return "Pick up the red fuse from beside the pieces of android on the desk" +
					" in the robotics workshop." +
					" Head to the elevator and place the red fuse within the circuit box.";
			}
			
		}
		
		private function BlueFuseSolution():String{
			if(game.SavedGame.SavedGameObj.data.ElevatorFuse != undefined){
				if(game.SavedGame.SavedGameObj.data.ElevatorFuse['BlueAttached'] == 'Yes'){
					return ElevatorFuseSolution();
				}else{
					return "Inside the toolbox on the center desk in the second floor office is" +
						" a blue fuse. Pick it up and head to the elevator. Place the blue fuse in" +
						" the appropriate slot within the elevator's circuit box.";
				}
			}else{
				return "Inside the toolbox on the center desk in the second floor office is" +
					" a blue fuse. Pick it up and head to the elevator. Place the blue fuse in" +
					" the appropriate slot within the elevator's circuit box.";
			}
			
			
		}
		
		private function ElevatorFuseSolution():String{
			if(game.SavedGame.SavedGameObj.data.ElevatorFuse != undefined){
				if(game.SavedGame.SavedGameObj.data.ElevatorFuse['Solved'] == 'Yes'){
					return BathroomMirrorHint();
				}else{
					return "Compare the red, green, and blue circuits in the elevator to the equations written on" +
						" the three sheets of paper located on the table in the second floor office kitchen. " +
						"Notice that there are three equations which equal 100. Enter these formulas into " +
						" circuit box in the elevator. " +
						"\n RED   : (30-10+5)x4" +
						"\n GREEN : (96+32)÷2+36" +
						"\n BLUE  : (7x9)+(42-5)";	
				}
			}else{
				return "Compare the red, green, and blue circuits in the elevator to the equations written on" +
					"the three sheets of paper located on the table in the second floor office kitchen. " +
					"Notice that there are three equations which equal 100. Enter these formulas into " +
					" circuit box in the elevator. A set of correct equations: " +
					"\n RED   : (30-10+5)x4" +
					"\n GREEN : (96+32)÷2+36" +
					"\n BLUE  : (7x9)+(42-5)";	
			}
			
		}
		private function BathroomMirrorHint():String{
			if(game.SavedGame.SavedGameObj.data.Bathroom != undefined){	
				if(game.SavedGame.SavedGameObj.data.Bathroom['MirrorUnlocked'] == 'Yes'){	
					return UnlockDiagnosticSolution();
				}else{
					return "Use the screwdriver with the blue handle on the mirror in the bathroom. " +
						"Study the message hidden behind the mirror in the bathroom.";
				}
			}else{
				return "Use the screwdriver with the blue handle on the mirror in the bathroom. " +
					"Study the message hidden behind the mirror in the bathroom.";
			}
		}
		
		private function UnlockDiagnosticSolution():String{
			if(game.SavedGame.SavedGameObj.data.ServerRoomPal != undefined){	
				if(game.SavedGame.SavedGameObj.data.ServerRoomPal['PassCodeSolved'] == 'Yes'){
					return ProgrammerDrawerSolution();
				}else{
					return "Compare the message written on the post-it note on the large computer in the server room with" +
						" the book about cryptography found on the desk in the rocketry room with " +
						"the book about computers next to the drafting table in the second floor office." +
						"[ONE TIME, CAESAR, ENIGMA] corresponds to " +
						"[VI: ONE TIME PAD, II: CAESAR SHIFT, VIII: ENIGMA] in the cryptography book. " +
						"In the book on computer history II,VI,VIII corresponds to [H] for HOLLERITH, [A] for ANTIKYTHERA, " +
						"and [B] for BOMBA. Enter [H-A-B] into the ADIMM DIAGNOSTIC screen " +
						"on the large computer in the server room.";
				}
			}else{
				return "Compare the message written on the post-it note on the large computer in the server room with" +
					" the book about cryptography found on the desk in the rocketry room with " +
					"the book about computers next to the drafting table in the second floor office." +
					"[ONE TIME, CAESAR, ENIGMA] corresponds to " +
					"[VI: ONE TIME PAD, II: CAESAR SHIFT, VIII: ENIGMA] in the cryptography book. " +
					"In the book on computer history II,VI,VIII corresponds to [H] for HOLLERITH, [A] for ANTIKYTHERA, " +
					"and [B] for BOMBA. Enter [H-A-B] into the ADIMM DIAGNOSTIC screen " +
					"on the large computer in the server room.";
			}
			
		}
		
		private function  ProgrammerDrawerSolution():String{
			if(game.SavedGame.SavedGameObj.data.OfficeProgrammer != undefined){				
				if(game.SavedGame.SavedGameObj.data.OfficeProgrammer['DrawerUnlocked'] == 'Yes'){
					return BrokenAdimmSolution();
				}else{
					return "Pick up the key from the table in the center of the rocketry room " +
						"and use it to unlock the file cabinet in the left corner of the second floor" +
						" office.";
				}
			}else{
				return "Pick up the key from the table in the center of the rocketry room " +
					"and use it to unlock the file cabinet in the left corner of the second floor" +
					" office.";
			}
			
		}
		
		
		private function BrokenAdimmSolution():String{
			if(game.SavedGame.SavedGameObj.data.ServerRoomComputer != undefined){
				if(game.SavedGame.SavedGameObj.data.ServerRoomComputer['CubeDamage'] == 'Attached'){
					return RunAdimmDiagnosticSolution();
				}else{
					if(game.SavedGame.SavedGameObj.data.ServerRoomComputer['CubeDamage'] == 'Gone'){
						return RunAdimmDiagnosticSolution();
					}else{
						return "Pick up the damaged metal cube from the box inside the filing cabinet by" +
							" the corner desk in the second floor office. Take the cube to the server room" +
							" and place the cube inside the machine located within the left tower of the large computer.";
					}
				}
			}else{
				return "Pick up the damaged metal cube from the box inside the filing cabinet by" +
					" the corner desk in the second floor office. Take the cube to the server room" +
					" and place the cube inside the machine located within the left tower of the large computer.";
			}
			
		}
		
		private function RunAdimmDiagnosticSolution():String{
			if(game.SavedGame.SavedGameObj.data.ServerRoomPal != undefined){
				if(game.SavedGame.SavedGameObj.data.ServerRoomPal['AdimmRepaired'] == 'Yes'){
					return OpenVanRearSolution();
				}else{
					return "Use the ADIMM DIAGNOSTIC program on the computer in the server room." +
						" Tap each of the four error messages. When prompted, select 'Y' to start" +
						" repairing the ADIMM cube module.";
				}
			}else{
				return "Use the ADIMM DIAGNOSTIC program on the computer in the server room." +
					" Tap each of the four error messages. When prompted, select 'Y' to start" +
					" repairing the ADIMM cube module.";
			}			
		}
		private function OpenVanRearSolution():String{
			if(game.SavedGame.SavedGameObj.data.ExteriorRear != undefined){				
				if(game.SavedGame.SavedGameObj.data.ExteriorRear['TrunkUnlocked'] == 'Yes'){	
					return EnterGreenHouseSolution();
				}else{
					return "Pick up the bolt-cutters from the robotics workshop and use them to cut the pad-lock off the back" +
						" of the van behind the building.";
				}
			}else{
				return "Pick up the bolt-cutters from the robotics workshop and use them to cut the pad-lock off the back" +
					" of the van behind the building.";
			}
			
		}
		
		private function EnterGreenHouseSolution():String{
			if(game.SavedGame.SavedGameObj.data.ThirdFloorHall != undefined){
				if(game.SavedGame.SavedGameObj.data.ThirdFloorHall['GasMaskAttached'] == 'Yes'){
					return VenusSolution();
				}else{
					return "Pick up the gas mask from the rear of the van located behind the building." +
						" Head to the third floor using the elevator and open the door on the left." +
						" After the gas has settled, use the mask to enter the room.";
				}
			}else{
				return "Pick up the gas mask from the rear of the van located behind the building." +
					" Head to the third floor using the elevator and open the door on the left." +
					" After the gas has settled, use the mask to enter the room.";
			}
			
			
		}
		
		private function VenusSolution():String{
			if(game.SavedGame.SavedGameObj.data.GreenHouseVenus != undefined){
				if(game.SavedGame.SavedGameObj.data.GreenHouseVenus['MetalAttached'] == 'Yes'){
					return KomaPuzzleSolution();
				}else{
					return "Head to the top the fire-escape located in the rear of the building" +
						" and pick up the twisted piece of metal. Use the piece of metal to jam open" +
						" the giant plant creature's jaws";
				}
			}else{
				return "Head to the top the fire-escape located in the rear of the building" +
					" and pick up the twisted piece of metal. Use the piece of metal to jam open" +
					" the giant plant creature's jaws";
			}
			
		}
		
		
		private function KomaPuzzleSolution():String{
			if(game.SavedGame.SavedGameObj.data.RoboticsRoomKomaPuzzle != undefined){
				if(game.SavedGame.SavedGameObj.data.RoboticsRoomKomaPuzzle['Solved'] == 'Yes'){
					return AdimmPowerSupplySolution();
				}else{
					return "Rotate the five dials on the face of the orange robot in the ground floor" +
						" workshop so the white stripes on each are aligned. Start with the lower right," +
						" then the upper left, then upper right, then lower left, then finally upper center.";
				}
			}else{
				return "Rotate the five dials on the face of the orange robot in the ground floor" +
					" workshop so the white stripes on each are aligned. Start with the lower right," +
					" then the upper left, then upper right, then lower left, then finally upper center.";
			}
			
		}
		
		
		private function AdimmPowerSupplySolution():String{
			if(game.SavedGame.SavedGameObj.data.RoboticsBody != undefined){	
				if(game.SavedGame.SavedGameObj.data.RoboticsBody['PowerSupply'] == 'Attached'){	
					return FanSolution();
				}else{
					return "Pick up the futuristic power-supply from the unlocked orange robot " +
						"in the center of the robotics workshop. Go over to the nearby workbench," +
						" open the android's chest and insert the power supply into the circular" +
						" cavity.";	
				}
			}else{
				return "Pick up the futuristic power-supply from the unlocked orange robot " +
					"in the center of the robotics workshop. Go over to the nearby workbench," +
					" open the android's chest and insert the power supply into the circular" +
					" cavity.";	
			}
			
			
		}
		
		private function FanSolution():String{
			if(game.SavedGame.SavedGameObj.data.BathroomDuctFan != undefined){	
				if(game.SavedGame.SavedGameObj.data.BathroomDuctFan['Stick'] == 'Attach'){	
					return HardDriveSolution();
				}else{
					return "Take the broken mop handle found beside the custodial cart on the second floor" +
						" landing to the rotating fan inside the ventilation shaft. Use the broken mop handle" +
						" to jam the fan to a stop.";
				}
			}else{
				return "Take the broken mop handle found beside the custodial cart on the second floor" +
					" landing to the rotating fan inside the ventilation shaft. Use the broken mop handle" +
					" to jam the fan to a stop.";
			}
			
		}
		
		private function HardDriveSolution():String{
			if(game.SavedGame.SavedGameObj.data.BathroomDuctFan != undefined){	
				if(game.SavedGame.SavedGameObj.data.BathroomDuctFan['HardDrive'] == 'PickedUp'){	
					return MPPIDAdimmSolution();
				}else{
					return "Take the mechanical claw found beside the workbench in the ground floor robotics workshop" +
						" to the jammed fan inside the ventilation duct. Use the mechanical to extend your reach and " +
						"pick up the hard-drive.";	
				}
			}else{
				return "Take the mechanical claw found beside the workbench in the ground floor robotics workshop" +
					" to the jammed fan inside the ventilation duct. Use the mechanical to extend your reach and " +
					"pick up the hard-drive.";	
			}
		}
		
		private function MPPIDAdimmSolution():String{
			if(game.SavedGame.SavedGameObj.data.RocketRoomComputerDesk != undefined){
				if(game.SavedGame.SavedGameObj.data.RocketRoomComputerDesk['CubeDamage'] == 'Attached'){	
					return MPPIDHDDSolution();
				}else if(game.SavedGame.SavedGameObj.data.RocketRoomComputerDesk['CubeDamage'] == 'Gone'){
					return MPPIDHDDSolution();
				}else{
					return "After taking the repaired multifaceted cube from the computer in the server room, " +
						"head to the nearby rocketry research room. Place the cube inside the machine beside the computer" +
						" on the left side of the rocketry room.";
				}
			}else{
				return "After taking the repaired multifaceted cube from the computer in the server room, " +
					"head to the nearby rocketry research room. Place the cube inside the machine beside the computer" +
					" on the left side of the rocketry room.";
			}
			
		}
		
		private function MPPIDHDDSolution():String{
			if(game.SavedGame.SavedGameObj.data.RocketRoomComputerDesk != undefined){
				if(game.SavedGame.SavedGameObj.data.RocketRoomComputerDesk['HDD'] == 'Attached'){	
					return AdimmWriteSolution();
				}else{
					return "Take the hard-drive that was found behind the fan in the ventilation shaft and" +
						" place it into the computer tower in the left side of the rocketry research room on" +
						" the second floor.";
				}
			}else{
				return "Take the hard-drive that was found behind the fan in the ventilation shaft and" +
					" place it into the computer tower in the left side of the rocketry research room on" +
					" the second floor.";
			}
			
		}
		
		private function AdimmWriteSolution():String{
			if(game.SavedGame.SavedGameObj.data.RocketRoomComputer != undefined){
				if(game.SavedGame.SavedGameObj.data.RocketRoomComputer['WriteSuccess'] == 'Yes'){
					return AdimmPowerCableSolution();
				}else{
					return "Use the computer in the rocketry research room on the second floor." +
						" Select 'MPP-IP' and then press 'INSTALL.'";
				}
			}else{
				return "Use the computer in the rocketry research room on the second floor." +
					" Select 'MPP-IP' and then press 'INSTALL.'";
			}
			
			
		}
		
		
		private function AdimmPowerCableSolution():String{
			if(game.SavedGame.SavedGameObj.data.RoboticsBody != undefined){	
				if(game.SavedGame.SavedGameObj.data.RoboticsBody['Cord'] == 'Attached'){
					return AdimmCubeSolution();
				}else{
					return "Remove one of the black cables from the legs of the android hanging" +
						" beside the workbench in the robotics workshop. Use the cable to connect the" +
						" android's head to it's torso.";
				}
			}else{
				return "Remove one of the black cables from the legs of the android hanging" +
					" beside the workbench in the robotics workshop. Use the cable to connect the" +
					" android's head to it's torso.";
			}
			
		}
		
		private function AdimmCubeSolution():String{
			if(game.SavedGame.SavedGameObj.data.RoboticsBody != undefined){
				if(game.SavedGame.SavedGameObj.data.RoboticsBody['Cube'] == 'Attached'){
					return TurnOnAdimm();
				}else{
					return "Place the now repaired and programmed faceted cube into" +
						" into the brain-case of android in the robotics";
				}
			}else{
				return "Place the now repaired and programmed faceted cube into" +
					" into the brain-case of android in the robotics";
			}
			
		}
		
		private function TurnOnAdimm():String{
			if(game.SavedGame.SavedGameObj.data.RoboticsBody != undefined){	
				if(game.SavedGame.SavedGameObj.data.RoboticsBody['AdimmActive'] == 'Yes'){
					return AdimmEthernetSolution();
				}else{
					return "Make sure to close the lid to the disassembled android's head and chest.";
				}
			}else{
				return "Make sure to close the lid to the disassembled android's head and chest.";
			}
			
		}
		
		private function AdimmEthernetSolution():String{
			if(game.SavedGame.SavedGameObj.data.RoboticsBody != undefined){	
				if(game.SavedGame.SavedGameObj.data.RoboticsBody['Ethernet'] == 'Attached'){	
					return ListenToAdimmSolution();
				}else{
					return "A purple ethernet cable can be found on the floor of the third floor hall," +
						" immediately outside the elevator. Take the cable and use it to connect the android" +
						" in the ground floor robotics workshop to the building's network...";
				}
			}else{
				return "A purple ethernet cable can be found on the floor of the third floor hall," +
					" immediately outside the elevator. Take the cable and use it to connect the android" +
					" in the ground floor robotics workshop to the building's network...";
			}
		}
		private function ListenToAdimmSolution():String{
			if(game.SavedGame.SavedGameObj.data.ThirdFloorHall != undefined){
				if(game.SavedGame.SavedGameObj.data.ThirdFloorHall['LabDoorOpen'] == 'Yes'){
					return BuidlingOfficePushButtonSolution();
				}else{
					return "Speak with ADIMM, now activated and sitting on the workbench in the" +
						" robotics workshop. Ask ADIMM to unlock the door on the third floor," +
						" then take the elevator up and open the door.";
				}
			}else{
				return "Speak with ADIMM, now activated and sitting on the workbench in the" +
					" robotics workshop. Ask ADIMM to unlock the door on the third floor," +
					" then take the elevator up and open the door.";
			}
			
		}
		private function BuidlingOfficePushButtonSolution():String{
			if(game.SavedGame.SavedGameObj.data.BuildingOfficePushBox != undefined){	
				if(game.SavedGame.SavedGameObj.data.BuildingOfficePushBox['PushBox'] == 'Attached'){	
					return BuildingOfficeBackDoorSolution();
				}else{
					return "Take the small six-button panel from the drawer of the desk with the computer" +
						" in the rocketry research room on the second floor and place it in the " +
						" slot on the wall next to the locked door in the first floor copy room.";
				}
			}else{
				return "Take the small six-button panel from the drawer of the desk with the computer" +
					" in the rocketry research room on the second floor and place it in the " +
					" slot on the wall next to the locked door in the first floor copy room.";
			}
			
		}
		private function BuildingOfficeBackDoorSolution():String{
			if(game.SavedGame.SavedGameObj.data.BuildingOfficePushBox != undefined){
				if(game.SavedGame.SavedGameObj.data.BuildingOfficePushBox['Solved'] == 'Yes'){
					return SafeSolution();
				}else{
					return "Compare the Morse tones coming through the phone at the front desk in the lobby," +
						" the speaker in the elevator, and the radio in the van,  to the " +
						"booklet on the desk in the copyroom." +
						" The tones from the phone [.---- , -..- , -.-.] translate to 1, X, K." +
						" The tones from the elevator [..--- , -..- , -.-.] translate to 2 ,O, C." +
						" The tones from the radio [...-- , --.- , .--.] translate to 3, Q, P." +
						" Enter XKOCQP going from left to right, top to bottom in the six button panel next to the locked" +
						" door in the copy room.";
				}
			}else{
				return "Compare the Morse tones coming through the phone at the front desk in the lobby," +
					" the speaker in the elevator, and the radio in the van,  to the " +
					"booklet on the desk in the copyroom." +
					" The tones from the phone [.---- , -..- , -.-.] translate to 1, X, K." +
					" The tones from the elevator [..--- , -..- , -.-.] translate to 2 ,O, C." +
					" The tones from the radio [...-- , --.- , .--.] translate to 3, Q, P." +
					" Enter XKOCQP going from left to right, top to bottom in the six button panel next to the locked" +
					" door in the copy room.";
			}
			
			
		}
		
		private function SafeSolution():String{
			if(game.SavedGame.SavedGameObj.data.BuildingOfficeLock != undefined){	
				if(game.SavedGame.SavedGameObj.data.BuildingOfficeLock['Solved'] == 'Yes'){	
					return GreenHouseRedTubeSolution();
				}else{
					return "Notice the design of the large painting that covers the safe in the wall of the ground floor back-office reading room." +
						" The same shape can be seen among the Rorschach ink-blot papers in the bed of the copy machine in the nearby copy room." +
						" The shape is listed under '#5' and has the description 'descent capsule'. Upstairs in the second floor rocketry research room " +
						"is a white board describing the CUPID space telescope's mission. #5 describes its descent and has the date  Dec. 31st listed, or 12-31. " +
						" Enter 1231 into the safe behind the painting in the ground floor reading room.";
				}
			}else{
				return "Notice the design of the large painting that covers the safe in the wall of the ground floor back-office reading room." +
					" The same shape can be seen among the Rorschach ink-blot papers in the bed of the copy machine in the nearby copy room." +
					" The shape is listed under '#5' and has the description 'descent capsule'. Upstairs in the second floor rocketry research room " +
					"is a white board describing the CUPID space telescope's mission. #5 describe its descent and has the date Dec. 31st listed, or 12-31. " +
					" Enter 1231 into the safe behind the painting in the ground floor reading room.";
			}
			
		}
		private function GreenHouseRedTubeSolution():String{
			if(game.SavedGame.SavedGameObj.data.GreenHouseTable != undefined){	
				if(game.SavedGame.SavedGameObj.data.GreenHouseTable['RedTube'] == 'Attached'){
					return EmptyTubeCoffeeMachineSolution();
				}else{
					return "Take the glass tube found in the wall safe in the ground floor reading room" +
						" and place it into the machine on the table in the third floor botany laboratory.";
				}
			}else{
				return "Take the glass tube found in the wall safe in the ground floor reading room" +
					" and place it into the machine on the table in the third floor botany laboratory.";
			}
			
		}
		
		private function EmptyTubeCoffeeMachineSolution():String{
			if(game.SavedGame.SavedGameObj.data.LabHexPuzzle != undefined){
				if(game.SavedGame.SavedGameObj.data.LabHexPuzzle['Solved'] == 'Yes'){
					return PlaceBlueTubeSolution();
				}else{
					return "After placing the empty glass cylindrical tube into the machine" +
						" next to the laptop on the table in the central laboratory, start" +
						" using the laptop's computer program. Within the program, select and" +
						" rotate shapes so the through out the highlighted all touching cells" +
						" are connected by a line.";
				}
			}else{
				return "After placing the empty glass cylindrical tube into the machine" +
					" next to the laptop on the table in the central laboratory, start" +
					" using the laptop's computer program. Within the program, select and" +
					" rotate shapes so the through out the highlighted all touching cells" +
					" are connected by a line.";
			}
		}
		
		private function PlaceBlueTubeSolution():String{
			if(game.SavedGame.SavedGameObj.data.GreenHouseTable != undefined){	
				if(game.SavedGame.SavedGameObj.data.GreenHouseTable['BlueTube'] == 'Attached'){
					return SyringPlaceSolution();
				}else{
					return "Pick up the glass tube now filled with a blue fluid from " +
						"the machine on the table in the central laboratory and take into" +
						" the botany research laboratory. Place the filled tube into the machine" +
						" in the center of the botany lab.";
				}
			}else{
				return "Pick up the glass tube now filled with a blue fluid from " +
					"the machine on the table in the central laboratory and take into" +
					" the botany research laboratory. Place the filled tube into the machine" +
					" in the center of the botany lab.";
			}
			
		}
		
		private function SyringPlaceSolution():String{
			if(game.SavedGame.SavedGameObj.data.GreenHouseTable != undefined){	
				if(game.SavedGame.SavedGameObj.data.GreenHouseTable['Syringe'] == 'Attached'){
					return SlideSolution();
				}else if(game.SavedGame.SavedGameObj.data.GreenHouseTable['Syringe'] == 'PickedUp'){	
					return SlideSolution();
				}else{
					return "Take the syringe found on the table in the central laboratory on " +
						"the third floor and place it in the tilted platform of the machine" +
						" on the table in the botany research laboratory.";
				}
			}else{
				return "Take the syringe found on the table in the central laboratory on " +
					"the third floor and place it in the tilted platform of the machine" +
					" on the table in the botany research laboratory.";
			}
			
		}
		
		private function SlideSolution():String{
			if(game.SavedGame.SavedGameObj.data.GreenHouseTable != undefined){	
				if(game.SavedGame.SavedGameObj.data.GreenHouseTable['Slide'] == 'Attached'){
					return SolveMicroscopeSolution();
				}else{
					return "Inside a metal briefcase on the desk in the ground floor reading room" +
						" there is a glass sample slide. Take the slide and place it" +
						" under the lens of the microscope in the botany laboratory.";
					
				}
			}else{
				return "Inside a metal briefcase on the desk in ground floor reading room" +
					" there is a glass sample slide. Take the slide and place it" +
					" under the lens of the microscope in the botany laboratory.";
			}
		}
		
		private function SolveMicroscopeSolution():String{
			if(game.SavedGame.SavedGameObj.data.GreenHouseMicroscope != undefined){
				if(game.SavedGame.SavedGameObj.data.GreenHouseMicroscope['Solved'] == 'Yes'){
					return SporeMeshSyringeSolution();
				}else{
					return "Under the microscope in the botany laboratory, move the three microscopic cell forms from the left to the right side" +
						" of the green cell wall under the microscope on the table in the botany laboratory." +
						" Start by placing the small blue form and the small yellow form onto the pump," +
						" then move them over to the right side, dismounting each from the pump. Then place the" +
						" red form onto the pump and move it over to the right side as well.";
				}
			}else{
				return "Under the microscope in the botany laboratory, move the three microscopic cell forms from the left to the right side" +
					" of the green cell wall under the microscope on the table in the botany laboratory." +
					" Start by placing the small blue form and the small yellow form onto the pump," +
					" then move them over to the right side, dismounting each from the pump. Then place the" +
					" red form onto the pump and move it over to the right side as well.";
			}
		}
		
		
		private function SporeMeshSyringeSolution():String{
			if(game.SavedGame.SavedGameObj.data.GreenHouseSpore != undefined){	
				if(game.SavedGame.SavedGameObj.data.GreenHouseSpore['Syringe'] == 'Attached'){	
					return SporeMeshSolutionSolution();
				}else{
					return "Pick up the syringe - now filled with the glowing fluid - and inject into" +
						" the growth covering the door on the right side of the botany laboratory.";
				}
			}else{
				return "Pick up the syringe - now filled with the glowing fluid - and inject into" +
					" the growth covering the door on the right side of the botany laboratory.";
			}
			
		}
		private function SporeMeshSolutionSolution():String{
			if(game.SavedGame.SavedGameObj.data.GreenHouseSpore != undefined){	
				if(game.SavedGame.SavedGameObj.data.GreenHouseSpore['Solved'] == 'Yes'){
					return AcidCoffeeSolution();
				}else{
					return "Study the information in the print-out on the table next to the microscope" +
						" in the botany laboratory. Notice the direction of the zig-zagging shape and the order" +
						" of the colors. Match the starting point of the zig-zagging shape with the starting color" +
						" of the color wheel, then enter the colors into the growth covering the nearby door. " +
						"Starting from the upper-left and proceeding down the colors will be : " +
						" BLACK, BLUE, MAGENTA, RED, YELLOW, CYAN, GREEN, WHITE, GREEN, BLACK.";					
				}
			}else{
				return "Study the information in the print-out on the table next to the microscope" +
					" in the botany laboratory. Notice the direction of the zig-zagging shape and the order" +
					" of the colors. Match the starting point of the zig-zagging shape with the starting color" +
					" of the color wheel, then enter the colors into the growth covering the nearby door. " +
					"Starting from the upper-left and proceeding down the colors will be : " +
					" BLACK, BLUE, MAGENTA, RED, YELLOW, CYAN, GREEN, WHITE, GREEN, BLACK.";	
			}
			
		}
		private function AcidCoffeeSolution():String{
			if(game.SavedGame.SavedGameObj.data.LabDoor != undefined){	
				if(game.SavedGame.SavedGameObj.data.LabDoor['Melted'] == 'Yes'){	
					return HeinleinBookSolution();
				}else{
					return "Pick up the empty coffee pot from the genetics lab on the third floor." +
						" Head down to the rear of the building and use the coffee pot to pick up some " +
						" of the corrosive bio-chemical waste beside the dumpster. Take the coffee pot," +
						" now filled, and pour the contents onto the seal of the door in the central" +
						" laboratory on the third floor.";
				}
			}else{
				return "Pick up the empty coffee pot from the genetics lab on the third floor." +
					" Head down to the rear of the building and use the coffee pot to pick up some " +
					" of the corrosive bio-chemical waste beside the dumpster. Take the coffee pot," +
					" now filled, and pour the contents onto the seal of the door in the central" +
					" laboratory on the third floor.";
			}
			
		}
		private function HeinleinBookSolution():String{
			if(game.SavedGame.SavedGameObj.data.BuildingOfficeBookCase != undefined){	
				if(game.SavedGame.SavedGameObj.data.BuildingOfficeBookCase['HeinleinAttached'] == "Yes"){	
					return BookSaganSolution();
				}else{
					return "Pick up the copy of 'The Puppet Masters' from the shelf" +
						" inside the deep laboratory with the chemistry set on the third floor." +
						" Place the book on the bookcase in the ground floor reading room.";
				}
			}else{
				return "Pick up the copy of 'The Puppet Masters' from the shelf" +
					" inside the deep laboratory with the chemistry set on the third floor." +
					" Place the book on the bookcase in the ground floor reading room.";
			}
			
		}
		
		
		
		private function BookSaganSolution():String{
			if(game.SavedGame.SavedGameObj.data.BuildingOfficeBookCase != undefined){	
				if(game.SavedGame.SavedGameObj.data.BuildingOfficeBookCase['SaganAttached'] == "Yes"){	
					return BookAsimovHint();
				}else{
					return "Take the book from the chair behind the desk in the ground floor reading " +
						"room and place it onto the nearby bookcase.";
				}
			}else{
				return "Take the book from the chair behind the desk in the ground floor reading " +
					"room and place it onto the nearby bookcase.";
			}
			
		}
		
		private function BookAsimovHint():String{
			if(game.SavedGame.SavedGameObj.data.BuildingOfficeBookCase != undefined){	
				if(game.SavedGame.SavedGameObj.data.BuildingOfficeBookCase['AsimovAttached'] == "Yes"){
					return BookClarkeHint();
				}else{
					return "Take the book from the cabinet deep inside the botany laboratory." +
						" Place the book - Isaac Asimov's 'The Gods Themselves' - onto the bookcase " +
						"in the reading room on the ground floor";
				}
			}else{
				return "Take the book from the cabinet deep inside the botany laboratory." +
					" Place the book - Isaac Asimov's 'The Gods Themselves' - onto the bookcase " +
					"in the reading room on the ground floor";
			}
			
		}
		
		private function BookClarkeHint():String{
			if(game.SavedGame.SavedGameObj.data.BuildingOfficeBookCase != undefined){	
				if(game.SavedGame.SavedGameObj.data.BuildingOfficeBookCase['ClarkeAttached'] == "Yes"){
					return SolveBookcaseSolution();
				}else{
					return "Take the copy of \"Childhood's End\" by Arthur C. Clarke found in the front compartment of the van behind" +
						" the building and place it onto the bookcase in the ground floor reading room.";
				}
			}else{
				return "Take the copy of \"Childhood's End\" by Arthur C. Clarke found in the front compartment of the van behind" +
					" the building and place it onto the bookcase in the ground floor reading room.";
			}
			
		}
		
		private function SolveBookcaseSolution():String{
			if(game.SavedGame.SavedGameObj.data.BuildingOfficeBookCase != undefined){	
				if(game.SavedGame.SavedGameObj.data.BuildingOfficeBookCase['Solved'] == "Yes"){
					return DNACanisterSolution();
				}else{
					return "Study the book on mythology found in the rear of the van parked behind the building." +
						" Notice that the word 'Chaos' is underlined. C-H-A-O-S are the first" +
						" letters of the authors' names whose books are on the shelf in the ground floor reading" +
						" room. Arrange the books to spell out CHAOS.";
				}
			}else{
				return "Study the book on mythology found in the rear of the van parked behind the building." +
					" Notice that the word 'Chaos' is underlined. C-H-A-O-S are the first" +
					" letters of the authors' names whose books are on the shelf in the ground floor reading" +
					" room. Arrange the books to spell out CHAOS.";
			}
			
		}
		
		private function DNACanisterSolution():String{
			trace("SMART 00");
			if(game.SavedGame.SavedGameObj.data.GeneticsRoomElectron != undefined){
				trace("SMART 01");
				if(game.SavedGame.SavedGameObj.data.GeneticsRoomElectron['DNAAttached'] == 'Yes'){
					trace("SMART 02");
					return ElectronCytosineHint();
				}else{
					trace("SMART 03");
					return "From the large industrial refrigerator near the chemistry set, deep inside " +
						"the third floor laboratory, remove the odd-shaped pressurized container filled with" +
						" the purple fluid. Place the container in the slot affixed to the powerful microscope" +
						" on left side of the genetic laboratory.";
				}
			}else{
				trace("SMART 04");
				return "From the large industrial refrigerator near the chemistry set, deep inside " +
					"the third floor laboratory, remove the odd-shaped pressurized container filled with" +
					" the purple fluid. Place the container in the slot affixed to the powerful microscope" +
					" on left side of the genetic laboratory.";
			}
			
		}
		
		private function ElectronCytosineHint():String{
			if(game.SavedGame.SavedGameObj.data.GeneticsRoomElectron != undefined){
				if(game.SavedGame.SavedGameObj.data.GeneticsRoomElectron['Bottle_c_Attached'] == 'Yes'){
					return ElectronAdenineHint();
				}else{
					return "Take the bottle filled with the red fluid, found in the small refrigerator deep " +
						"in the botany lab, and place it on to the device next to the powerful microscope in" +
						" the third floor genetics room.";
				}
			}else{
				return "Take the bottle filled with the red fluid, found in the small refrigerator deep " +
					"in the botany lab, and place it on to the device next to the powerful microscope in" +
					" the third floor genetics room.";
			}
			
		}
		private function ElectronAdenineHint():String{
			if(game.SavedGame.SavedGameObj.data.GeneticsRoomElectron != undefined){
				if(game.SavedGame.SavedGameObj.data.GeneticsRoomElectron['Bottle_a_Attached'] == 'Yes'){
					return ElectronMicroscopeHouseLeverSolution();
				}else{
					return "Take the bottle containing the green fluid from the large refrigerator" +
						" near the chemistry set deep inside the third floor laboratory." +
						" Place the bottle onto the device next to the powerful microscope in" +
						" the third floor genetics room.";
				}
			}else{
				return "Take the bottle containing the green fluid from the large refrigerator" +
					" near the chemistry set deep inside the third floor laboratory." +
					" Place the bottle onto the device next to the powerful microscope in" +
					" the third floor genetics room.";
			}
			
		}
		
		private function ElectronMicroscopeHouseLeverSolution():String{
			if(game.SavedGame.SavedGameObj.data.GeneticsRoomElectron != undefined){
				if(game.SavedGame.SavedGameObj.data.GeneticsRoomElectron['HoseAttached'] == 'Yes'){
					if(game.SavedGame.SavedGameObj.data.GeneticsRoomElectron['WheelTurned'] == 'Yes'){
						if(game.SavedGame.SavedGameObj.data.GeneticsRoomElectron['lever_g'] == 'Yes'){
							if(game.SavedGame.SavedGameObj.data.GeneticsRoomElectron['lever_a'] == 'Yes'){
								if(game.SavedGame.SavedGameObj.data.GeneticsRoomElectron['lever_c'] == 'Yes'){
									if(game.SavedGame.SavedGameObj.data.GeneticsRoomElectron['lever_t'] == 'Yes'){
										return ElectronMicroscopeHints();
									}else{
										return EMLSolutionText();
									}
								}else{
									return EMLSolutionText();
								}
							}else{
								return EMLSolutionText();
							}
						}else{
							return EMLSolutionText();
						}
					}else{
						return EMLSolutionText();
					}
				}else{
					return EMLSolutionText();
				}
			}else{
				return EMLSolutionText();
			}
			
			
		}
		private function EMLSolutionText():String{
			return "Connect the black hose dangling from the top of the powerful microscope in the genetics laboratory to" +
				" the pressurized canister containing the purple fluid. After the hose is connected, twist the wheel at the top" +
				" of the microscope. Once the purple fluid has been sucked into the microscope, tap each of the four levers beneath" +
				" the glass bottles to release their contents into the microscope's system.";
		}
		
		private function ElectronMicroscopeHints():String{
			if(game.SavedGame.SavedGameObj.data.GeneticsRoomMicroscope != undefined){	
				if(game.SavedGame.SavedGameObj.data.GeneticsRoomMicroscope['Solved'] == 'yes'){	
					return ContaimentCircuitSolution();
				}else{
					return "Study the long print-out on the floor of the central lab and also" +
						" the book by the chemistry set deep in the third floor lab's storage room. " +
						" Notice the letter groups: GTCAT, ACTGA, GAGTC." +
						" These correspond to the sequence needed to solve the microscope" +
						" in the genetics lab. The bottom of the chain needs to be matched to the top. " +
						"From left to right, the top of the sequences colors are: " +
						"\n PURPLE-PINK-RED-GREEN-PINK" +
						"\n GREEN-RED-PINK-PURPLE-GREEN"+
						"\n PURPLE-GREEN-PURPLE-PINK-RED";
					;
				}
			}else{
				return "Study the long print-out on the floor of the central lab and also" +
					" the book by the chemistry set deep in the third floor lab's storage room. " +
					" Notice the letter groups: GTCAT, ACTGA, GAGTC." +
					" These correspond to the sequence needed to solve the microscope" +
					" in the genetics lab. The bottom of the chain needs to be matched to the top. " +
					"From left to right, the top of the sequences colors are: " +
					"\n PURPLE-PINK-RED-GREEN-PINK" +
					"\n GREEN-RED-PINK-PURPLE-GREEN"+
					"\n PURPLE-GREEN-PURPLE-PINK-RED";
				;
			}
			
		}
		
		private function ContaimentCircuitSolution():String{
			if(game.SavedGame.SavedGameObj.data.ContainmentControl != undefined){		
				if(game.SavedGame.SavedGameObj.data.ContainmentControl['Solved'] == 'Yes'){
					return NailSampleSolution();
				}else{
					return "On the computer in the ground floor copy room, there is a circuit diagram." +
						" The symbols on the left side of the diagram indicate UP, CENTER and DOWN positions." +
						" The right side of the diagram shows six positions organized in two rows." +
						" These six positions correspond to the six levers on the control station underground." +
						" The levers should be positioned in the following manner:" +
						"\n DOWN - CENTER - UP" +
						"\n  UP  -  DOWN  - UP";
				}
			}else{
				return "On the computer in the ground floor copy room, there is a circuit diagram." +
					" The symbols on the left side of the diagram indicate UP, CENTER and DOWN positions." +
					" The right side of the diagram shows six positions organized in two rows." +
					" These six positions correspond to the six levers on the control station underground." +
					" The levers should be positioned in the following manner:" +
					"\n DOWN - CENTER - UP" +
					"\n  UP  -  DOWN  - UP";
			}
			
		}
		
		private function NailSampleSolution():String{
			if(game.SavedGame.SavedGameObj.data.GeneticsRoomBox != undefined){
				if(game.SavedGame.SavedGameObj.data.GeneticsRoomBox['Nails'] == 'Attached'){
					return GooBoxSolution();
				}else{
					return "Using the tweezers and sample vial, found in the bathroom medicine cabinet," +
						" pick up the finger nail clippings from the paper in the ground floor reading room." +
						" Take the filled vial to the machine in the far corner of the third floor genetics" +
						" laboratory, and place the nail clippings into the vat of jelly.";
				}
			}else{
				return "Using the tweezers and sample vial, found in the bathroom medicine cabinet," +
					" pick up the finger nail clippings from the paper in the ground floor reading room." +
					" Take the filled vial to the machine in the far corner of the third floor genetics" +
					" laboratory, and place the nail clippings into the vat of jelly.";
			}
			
		}
		
		private function GooBoxSolution():String{
			if(game.SavedGame.SavedGameObj.data.GeneticsRoomBox != undefined){
				if(game.SavedGame.SavedGameObj.data.GeneticsRoomBox['GooAttached'] == 'Yes'){
					return EyeGlassLensSolution();
				}else{
					return "Pour some of the purple contents from the test tube filled by completing" +
						" the DNA sequence, into the vat of jelly in the machine in the corner of the " +
						"genetics laboratory.";
				}
			}else{
				return "Pour some of the purple contents from the test tube filled by completing" +
					" the DNA sequence, into the vat of jelly in the machine in the corner of the " +
					"genetics laboratory.";
			}
			
			return "";
		}
		
		private function EyeGlassLensSolution():String{
			if(game.SavedGame.SavedGameObj.data.GeneticsRoomLensPuzzle != undefined){
				if(game.SavedGame.SavedGameObj.data.GeneticsRoomLensPuzzle['GlassLensAttached'] == 'Yes'){
					return SolveLensPuzzelSolution();
				}else{
					return "On the desk in the reading room can be found a tiny screwdriver. " +
						" Use this screwdriver to remove the lens from the broken pair of glasses." +
						" First, select either the glasses or the tiny screwdriver, then select" +
						" the other item. Then insert the lens into the empty slot of the machine in " +
						"the far corner of the third floor genetics laboratory.";
				}
			}else{
				return "On the desk in the reading room can be found a tiny screwdriver. " +
					" Use this screwdriver to remove the lens from the broken pair of glasses." +
					" First, select either the glasses or the tiny screwdriver, then select" +
					" the other item. Then insert the lens into the empty slot of the machine in " +
					"the far corner of the third floor genetics laboratory.";
			}
			
		}
		
		private function SolveLensPuzzelSolution():String{
			if(game.SavedGame.SavedGameObj.data.GeneticsRoomLensPuzzle != undefined){
				if(game.SavedGame.SavedGameObj.data.GeneticsRoomLensPuzzle['Solved'] == 'Yes'){
					return OpenContainmentHatchSolution();
				}else{
					return "Notice that the magazine in the second floor bathroom contains an advertisement" +
						" for the Mandelbrot RSC-2024: a tissue cultivation machine. It is the same machine in " +
						" the far corner of the genetics lab. The business card of William Loman, " +
						"Product Expectations Manager at Mandelbrot Corp., can be found in the kitchenette in the second floor office." +
						" On the back he has scribbled the numbers 6-41-92. Position the three lenses in the machine" +
						" on the third floor so they read in descending order: 6-41-92.";
				}
			}else{
				return "Notice that the magazine in the second floor bathroom contains an advertisement" +
					" for the Mandelbrot RSC-2024: a tissue cultivation machine. It is the same machine in " +
					" the far corner of the genetics lab. The business card of William Loman, " +
					"Product Expectations Manager at Mandelbrot Corp., can be found in the kitchenette in the second floor office." +
					" On the back he has scribbled the numbers 6-41-92. Position the three lenses in the machine" +
					" on the third floor so they read in descending order: 6-41-92.";
			}
			
		}
		
		private function OpenContainmentHatchSolution():String{
			if(game.SavedGame.SavedGameObj.data.ContainmentHatch != undefined){	
				if(game.SavedGame.SavedGameObj.data.ContainmentHatch['Hatch'] != undefined){	
					return ContainmentSwitchSolution();
				}else{
					return "Use the hand which grew out the Mandelbrot tissue cultivating machine " +
						" on the control pad of the hatch to the chamber deep underground.";
				}
			}else{
				return "Use the hand which grew out the Mandelbrot tissue cultivating machine " +
					" on the control pad of the hatch to the chamber deep underground.";
			}
			
		}
		
		private function ContainmentSwitchSolution():String{
			if(game.SavedGame.SavedGameObj.data.ContainmentCalibrator != undefined){
				if(game.SavedGame.SavedGameObj.data.ContainmentCalibrator['Solved'] == 'Yes'){
					return ContainmentCalibratorSolution();
				}else{
					return ContaimentSwitchSolutionBUNDLE00();
				}
			}else{
				return ContaimentSwitchSolutionBUNDLE00();
			}
			
			
		}
		
		private function ContaimentSwitchSolutionBUNDLE00():String{
			if(game.SavedGame.SavedGameObj.data.ContainmentConsole != undefined){
				if(game.SavedGame.SavedGameObj.data.ContainmentConsole['SpinnerOn'] == 'Yes'){
					return ContainmentCalibratorSolution();
				}else{
					return "In the sealed chamber deep underground, on the right-hand control console" +
						" is a screen which indicates the large machine in the center of chamber." +
						"Press the screen to activate the machine.";	
				}
			}else{
				return "In the sealed chamber deep underground, on the right-hand control console" +
					" is a screen which indicates the large machine in the center of chamber." +
					"Press the screen to activate the machine.";	
			}
		}
		
		private function ContainmentCalibratorSolution():String{
			if(game.SavedGame.SavedGameObj.data.ContainmentCalibrator != undefined){
				if(game.SavedGame.SavedGameObj.data.ContainmentCalibrator['Solved'] == 'Yes'){
					return JarWaterSolution();
				}else{
					return "Notice that the control console on the left side of the sealed chamber deep underground" +
						" has a 2,4,2 pattern from top to bottom, as does the information about the mineral used in the statue" +
						" outside the front of the building. Compare the abbreviations of the elements listed with the sheets" +
						" of paper on the floor of laboratory and the poster of the periodic table. Enter the corresponding symbols" +
						" and colors in the appropriate positions on the control console.";
				}
			}else{
				return "Notice that the control console on the left side of the sealed chamber deep underground" +
					" has a 2,4,2 pattern from top to bottom, as does the information about the mineral used in the statue" +
					" outside the front of the building. Compare the abbreviations of the elements listed with the sheets" +
					" of paper on the floor of laboratory and the poster of the periodic table. Enter the corresponding symbols" +
					" and colors in the appropriate positions on the control console.";
			}
			
		}
		
		private function JarWaterSolution():String{
			if(game.SavedGame.SavedGameObj.data.GreenHouseTable != undefined){	
				if(game.SavedGame.SavedGameObj.data.GreenHouseTable['Jar'] == 'PickedUp'){
					if(game.SavedGame.SavedGameObj.data.GreenHouseDeepShelf != undefined){
						if(game.SavedGame.SavedGameObj.data.GreenHouseDeepShelf['Water'] == "PickedUp"){	
							return JarWaterBurnerSolution();
						}else{
							if(game.SavedGame.SavedGameObj.data.OfficeKitchenSink != undefined){	
								if(game.SavedGame.SavedGameObj.data.OfficeKitchenSink['Water'] == 'PickedUp'){	
									return JarWaterBurnerSolution();
								}else{
									if(game.SavedGame.SavedGameObj.data.Bathroom != undefined){	
										if(game.SavedGame.SavedGameObj.data.Bathroom['Water'] == 'PickedUp'){	
											return JarWaterBurnerSolution();
										}else{
											return JarWaterText();
										}
									}else{
										return JarWaterText();
									}
								}
							}else{
								return JarWaterText();
							}
						}
					}else{
						return JarWaterText();
					}
				}else{
					return JarWaterText();
				}
			}else{
				return JarWaterText();
			}
		}
		
		private function JarWaterText():String{
			return "Use the Pyrex beaker, found on the table in the botany lab," +
				" and fill it with water at the sink in the kitchenette, the sink" +
				" in the bathroom, or the sink in the botany lab's back room.";
		}
		
		private function JarWaterBurnerSolution():String{
			if(game.SavedGame.SavedGameObj.data.DeepLabDesk != undefined){	
				if(game.SavedGame.SavedGameObj.data.DeepLabDesk['JarAttached'] == 'Yes'){	
					return RedRockSolution();
				}else{
					return "Use the Pyrex beaker, found on the table in the botany lab," +
						" and fill it with water at the sink in the kitchenette, the sink" +
						" in the bathroom, or the sink in the botany lab's back room.";
				}
			}else{
				return "Take the filled beaker and place it on the stand over" +
					" the Bunsen burner in the chemistry experiment deep inside the" +
					" third floor laboratory.";
			}
			
		}
		
		
		private function RedRockSolution():String{
			if(game.SavedGame.SavedGameObj.data.ExteriorCube != undefined){	
				if(game.SavedGame.SavedGameObj.data.ExteriorCube['RedRock'] == 'PickedUp'){	
					return AddRedRockToChemistrySolution();
				}else{
					return "Use the small hammer and chisel, found on the desk in the reading room," +
						" to knock out a piece of the cube statue outside the front of the building.";
				}
			}else{
				return "Use the small hammer and chisel, found on the desk in the reading room," +
					" to knock out a piece of the cube statue outside the front of the building.";
			}
			
		}
		
		private function AddRedRockToChemistrySolution():String{
			if(game.SavedGame.SavedGameObj.data.DeepLabDesk != undefined){	
				if(game.SavedGame.SavedGameObj.data.DeepLabDesk['RockAttached'] == 'Yes'){	
					return AddIodineToChemistrySolution();
				}else{
					return "Place the piece of red mineral broken off from the statue" +
						" into the beaker of the chemistry set deep in" +
						" the third floor laboratory.";
				}
			}else{
				return "Place the piece of red mineral broken off from the statue" +
					" into the beaker of the chemistry set deep in" +
					" the third floor laboratory.";
			}
			
		}
		
		private function AddIodineToChemistrySolution():String{
			if(game.SavedGame.SavedGameObj.data.DeepLabDesk != undefined){	
				if(game.SavedGame.SavedGameObj.data.DeepLabDesk['IodineAttached'] == 'Yes'){	
					return AddGooToChemistrySolution();
				}else{
					return "Use the bottle of Iodine, found in the medicine cabinet of the" +
						" second floor bathroom and pour it into the beaker of the chemistry" +
						" set deep within the third floor laboratory.";
				}
			}else{
				return "Use the bottle of Iodine, found in the medicine cabinet of the" +
					" second floor bathroom and pour it into the beaker of the chemistry" +
					" set deep within the third floor laboratory.";
			}
			
		}
		
		private function AddGooToChemistrySolution():String{
			if(game.SavedGame.SavedGameObj.data.DeepLabDesk != undefined){	
				if(game.SavedGame.SavedGameObj.data.DeepLabDesk['DNAAttached'] == 'Yes'){
					return SolveChemistrySetSolution();
				}else{
					return "Pour some of the purple fluid from the test tube into" +
						" the glass bowl of the chemistry" +
						" set deep within the third floor laboratory.";
				}
			}else{
				return "Pour some of the purple fluid from the test tube into" +
					" the glass bowl of the chemistry" +
					" set deep within the third floor laboratory.";
			}
			
		}
		
		private function SolveChemistrySetSolution():String{
			if(game.SavedGame.SavedGameObj.data.DeepLabDesk != undefined){	
				if(game.SavedGame.SavedGameObj.data.DeepLabDesk['DNARockFried'] == 'Yes'){
					return LoadInjectorSolution();
				}else{
					return "At the chemistry set deep within the third floor laboratory," +
						" ignite the Bunsen burner to start a reaction inside the beaker. " +
						" Once the product of the reaction has condensed into the electrolysis" +
						" bowl, tap the power supply to run an electrical circuit through the " +
						"contents of the bowl.";
					
				}
			}else{
				return "At the chemistry set deep within the third floor laboratory," +
					" ignite the Bunsen burner to start a reaction inside the beaker. " +
					" Once the product of the reaction has condensed into the electrolysis" +
					" bowl, tap the power supply to run an electrical circuit through the " +
					"contents of the bowl.";
			}
			
			return "";
		}
		
		private function LoadInjectorSolution():String{
			if(game.SavedGame.SavedGameObj.data.DeepLabDesk != undefined){	
				if(game.SavedGame.SavedGameObj.data.DeepLabDesk['SamplePickedUp'] == 'Yes'){		
					return PlaceTemplateSolution();
				}else{
					return "Use the multi-sample pipette, found on the" +
						" shelf beside the large refrigerator deep inside" +
						" the third floor laboratory.";
				}
			}else{
				return "Use the multi-sample pipette, found on the" +
					" shelf beside the large refrigerator deep inside" +
					" the third floor laboratory.";
			}
			
		}
		
		private function PlaceTemplateSolution():String{
			if(game.SavedGame.SavedGameObj.data.SpinWheel != undefined){	
				if(game.SavedGame.SavedGameObj.data.SpinWheel['TemplateFull'] == 'Yes'){			
					return SpinWheelSolveSolution();
				}else{
					return "Take the rectangular porcelain plate, found near the " +
						"chemistry set on the third floor, and combine it with the now filled" +
						" multiple sample pipette in your inventory. Then, place the filled" +
						"plate into the slot on the machine on the desk in the center of the genetics" +
						" laboratory. If you already added the plate before using the pipette, tap" +
						" the pipette onto the plate where it is attached to the machine.";
				}
			}else{
				return "Take the rectangular porcelain plate, found near the " +
					"chemistry set on the third floor, and combine it with the now filled" +
					" multiple sample pipette in your inventory. Then, place the filled" +
					"plate into the slot on the machine on the desk in the center of the genetics" +
					" laboratory. If you already added the plate before using the pipette, tap" +
					" the pipette onto the plate where it is attached to the machine.";
			}
			
		}
		private function SpinWheelSolveSolution():String{
			if(game.SavedGame.SavedGameObj.data.SpinWheel != undefined){
				if(game.SavedGame.SavedGameObj.data.SpinWheel["Solved"] == 'Yes'){
					return PickUpClampsSolution();
				}else{
					return "Study the information drawn on the chalkboard in the" +
						" ground floor reading room. Notice that shape and total (66) is" +
						" the same as on the machine on the desk in the genetics laboratory." +
						" Add the balls of gelatin to the various compartments of the wheel so" +
						" that the sum of the three values in any straight line is equal to 18 and each compartment holds a unique value." +
						" If a line is both equal to 18 and unique it will turn pink." +
						"\nBelow is a correct arrangement:" +
						"\n 1-6-11, 2-6-10, 3-6-9, 4-6-8,  5-6-7" ;
				}
			}else{
				return "Study the information drawn on the chalkboard in the" +
					" ground floor reading room. Notice that shape and total (66) is" +
					" the same as on the machine on the desk in the genetics laboratory." +
					" Add the balls of gelatin to the various compartments of the wheel so" +
					" that the sum of the three values in any straight line is equal to 18 and each compartment holds a unique value." +
					" If a line is both equal to 18 and unique it will turn pink." +
					"\nBelow is a correct arrangement:" +
					"\n 1-6-11, 2-6-10, 3-6-9, 4-6-8,  5-6-7" ;
			}
			
		}
		private function PickUpClampsSolution():String{
			if(game.SavedGame.SavedGameObj.data.GeneticsRoomDesk != undefined){	
				if(game.SavedGame.SavedGameObj.data.GeneticsRoomDesk['Cup'] == 'PickedUp'){
					return IgniteCupSolution();
				}else{
					return "Use the pair of metal tongs, which are found in the hidden room through the bookcase, to " +
						"pick up the ice-cold cup from within the machine on the table in the genetics lab on the third floor.";
				}
			}else{
				return "Use the pair of metal tongs, which are found in the hidden room through the bookcase, to " +
					"pick up the ice-cold cup from within the machine on the table in the genetics lab on the third floor.";
			}
			
		}
		private function IgniteCupSolution():String{
			if(game.SavedGame.SavedGameObj.data.RocketRoom != undefined){	
				if(game.SavedGame.SavedGameObj.data.RocketRoom['Creature'] == 'Alive'){	
					return CrateOpenSolution();
				}else{
					return "Use the pair of long metal tongs to place the sub-zero cup of metal goo" +
						" under the blast of the rocket engine.";
				}
			}else{
				return "Use the pair of long metal tongs to place the sub-zero cup of metal goo" +
					" under the blast of the rocket engine.";
			}
			
		}
		private function CrateOpenSolution():String{
			if(game.SavedGame.SavedGameObj.data.ExteriorCarRear != undefined){
				if(game.SavedGame.SavedGameObj.data.ExteriorCarRear['CaseUnlocked'] == 'Yes'){	
					return RockChiselSolution();
				}else{
					return "Use the crowbar, found in the hidden room through the bookcase," +
						" to pry open the wooden crate in the rear of the van behind the building.";
				}
			}else{
				return "Use the crowbar, found in the hidden room through the bookcase," +
					" to pry open the wooden crate in the rear of the van behind the building.";
			}
			
		}
		
		private function RockChiselSolution():String{
			if(game.SavedGame.SavedGameObj.data.ExteriorCarRear != undefined){
				if(game.SavedGame.SavedGameObj.data.ExteriorCarRear['ChiselUsed'] == 'Yes'){
					return RockDrillSolution();
				}else{
					return "Use the chisel and hammer to break away some of the rock" +
						" surrounding the object encased by the boulder in the specimen crate" +
						" in the rear of the van.";
				}
			}else{
				return "Use the chisel and hammer to break away some of the rock" +
					" surrounding the object encased by the boulder in the specimen crate" +
					" in the rear of the van.";
			}
			
			
		}
		
		private function RockDrillSolution():String{
			if(game.SavedGame.SavedGameObj.data.ExteriorCarRear != undefined){
				if(game.SavedGame.SavedGameObj.data.ExteriorCarRear['DrillUsed'] == 'Yes'){	
					return PlaceStoneOneSolution();
				}else{
					return "Use the drill to remove some of the rock" +
						" surrounding the object encased by the boulder in the specimen crate" +
						" in the rear of the van.";
				}
			}else{
				return "Use the drill to remove some of the rock" +
					" surrounding the object encased by the boulder in the specimen crate" +
					" in the rear of the van.";
			}
			
		}
		
		private function PlaceStoneOneSolution():String{
			if(game.SavedGame.SavedGameObj.data.LabAsteriodPuzzle != undefined){
				if(game.SavedGame.SavedGameObj.data.LabAsteriodPuzzle['Piece02Attached'] == 'Yes'){
					return OpenSatSolution();
				}else{
					return "Take the stone slab removed from the boulder in the back of the van" +
						" and place it into the matching depression on the surface of the asteroid" +
						" located in the central laboratory on the third floor.";
				}
			}else{
				return "Take the stone slab removed from the boulder in the back of the van" +
					" and place it into the matching depression on the surface of the asteroid" +
					" located in the central laboratory on the third floor.";
			}
			
		}
		private function OpenSatSolution():String{
			if(game.SavedGame.SavedGameObj.data.RocketRoomSat != undefined){				
				if(game.SavedGame.SavedGameObj.data.RocketRoomSat['CoverRemoved'] == 'Yes'){
					return PickUpStoneBallSolution();
				}else{
					return "Use the blue screwdriver to remove the damaged piece of housing" +
						" from the satellite in the second floor rocketry room.";
				}
			}else{
				return "Use the blue screwdriver to remove the damaged piece of housing" +
					" from the satellite in the second floor rocketry room.";
			}
			
		}
		
		private function PickUpStoneBallSolution():String{
			if(game.SavedGame.SavedGameObj.data.RocketRoomSat != undefined){	
				if(game.SavedGame.SavedGameObj.data.RocketRoomSat['OrbPickedUp'] == 'Yes'){
					return PlaceStoneOrbSolution();
				}else{
					return "Use the pair of forceps, found on the table" +
						" in the center of the botany lab, to pry the stone sphere loose" +
						" from where it impacted the satellite.";
				}
			}else{
				return "Use the pair of forceps, found on the table" +
					" in the center of the botany lab, to pry the stone sphere loose" +
					" from where it impacted the satellite.";
			}
			
		}
		
		private function PlaceStoneOrbSolution():String{
			if(game.SavedGame.SavedGameObj.data.LabAsteriodPuzzle != undefined){
				if(game.SavedGame.SavedGameObj.data.LabAsteriodPuzzle['PieceBallAttached'] == 'Yes'){
					return PlaceStoneTwoSolution();
				}else{
					return "Place the stone sphere removed from the satellite in the rocketry room" +
						" into the circular hole in the depression on the surface of the asteroid" +
						" located in the central laboratory on the third floor.";
				}
			}else{
				return "Place the stone sphere removed from the satellite in the rocketry room" +
					" into the circular hole in the depression on the surface of the asteroid" +
					" located in the central laboratory on the third floor.";
			}
			
		}
		
		private function PlaceStoneTwoSolution():String{
			if(game.SavedGame.SavedGameObj.data.LabAsteriodPuzzle != undefined){
				if(game.SavedGame.SavedGameObj.data.LabAsteriodPuzzle['Piece00Attached'] == 'Yes'){
					return PlaceStoneThreeSolution();
				}else{
					return "Place the stone slab, found on the table in the center of the genetics room, " +
						"into the matching depression on the surface of the asteroid" +
						" located in the central laboratory on the third floor.";
				}
			}else{
				return "Place the stone slab, found on the table in the center of the genetics room, " +
					"into the matching depression on the surface of the asteroid" +
					" located in the central laboratory on the third floor.";
			}
			
			
		}
		private function PlaceStoneThreeSolution():String{
			if(game.SavedGame.SavedGameObj.data.LabAsteriodPuzzle != undefined){
				if(game.SavedGame.SavedGameObj.data.LabAsteriodPuzzle['Piece04Attached'] == 'Yes'){
					return SolveAsteroidSolution();
				}else{
					return "Place the stone slab, found on the counter top deep within the botany lab," +
						" into the matching depression on the surface of the asteroid" +
						" located in the central laboratory on the third floor.";
				}
			}else{
				return "Place the stone slab, found on the counter top deep within the botany lab," +
					" into the matching depression on the surface of the asteroid" +
					" located in the central laboratory on the third floor.";	
			}
			
		}
		
		private function SolveAsteroidSolution():String{
			if(game.SavedGame.SavedGameObj.data.LabAsteriodPuzzle != undefined){
				if(game.SavedGame.SavedGameObj.data.LabAsteriodPuzzle['Solved'] == "Yes"){
					return PlaceBlueBallSolution();
				}else{
					return "Rotate the discs and center ball on the asteroid" +
						" so that all radial lines match each other and the notches along" +
						" the rim. Behind the mirror in the bathroom can be found an image of" +
						" the correct arrangement."
				}
			}else{
				return "Rotate the discs and center ball on the asteroid" +
					" so that all radial lines match each other and the notches along" +
					" the rim. Behind the mirror in the bathroom can be found an image of" +
					" the correct arrangement."
			}
			
		}
		
		private function PlaceBlueBallSolution():String{
			if(game.SavedGame.SavedGameObj.data.ContainmentQuantum != undefined){
				if(game.SavedGame.SavedGameObj.data.ContainmentQuantum['BlueAttached'] == 'Yes'){
					return PlaceRedBallSolution();
				}else{
					return "Take the luminescent blue orb from the remnants of the asteroid in the " +
						"central lab and combine it with the anomaly at the center of the sealed chamber " +
						"deep underground. Use the console on the right of the chamber to stop the" +
						" rotation of the machine if necessary.";
				}
			}else{
				return "Take the luminescent blue orb from the remnants of the asteroid in the " +
					"central lab and combine it with the anomaly at the center of the sealed chamber " +
					"deep underground. Use the console on the right of the chamber to stop the" +
					" rotation of the machine if necessary.";
			}
			
			
		}
		
		private function PlaceRedBallSolution():String{
			if(game.SavedGame.SavedGameObj.data.ContainmentQuantum != undefined){
				if(game.SavedGame.SavedGameObj.data.ContainmentQuantum['RedAttached'] == 'Yes'){
					return PlaceGreenBallSolution();
				}else{
					return "The red luminescent orb, found in the creature that's grown in " +
						"the second floor rocketry research room, should be combined with the anomaly at the center of the sealed chamber " +
						"deep underground. Use the console on the right of the chamber to stop the" +
						" rotation of the machine if necessary.";
				}
			}else{
				return "The red luminescent orb, found in the creature that's grown in " +
					"the second floor rocketry research room, should be combined with the anomaly at the center of the sealed chamber " +
					"deep underground. Use the console on the right of the chamber to stop the" +
					" rotation of the machine if necessary.";
			}
			
			
		}
		
		
		private function PlaceGreenBallSolution():String{
			if(game.SavedGame.SavedGameObj.data.ContainmentQuantum != undefined){
				if(game.SavedGame.SavedGameObj.data.ContainmentQuantum['GreenAttached'] == 'Yes'){
					return UlamSolution();
				}else{
					return "The luminescent green orb, found within the bulb of the giant" +
						" plant monster deep in the botany laboratory,  should be combined with the anomaly at the center of the sealed chamber " +
						"deep underground. Use the console on the right of the chamber to stop the" +
						" rotation of the machine if necessary.";
					
				}
			}else{
				return "The luminescent green orb, found within the bulb of the giant" +
					" plant monster deep in the botany laboratory,  should be combined with the anomaly at the center of the sealed chamber " +
					"deep underground. Use the console on the right of the chamber to stop the" +
					" rotation of the machine if necessary.";
			}
			
		}
		
		private function UlamSolution():String{
			if(game.SavedGame.SavedGameObj.data.ContainmentUlam != undefined){
				if(game.SavedGame.SavedGameObj.data.ContainmentUlam['Solved'] == 'Yes'){
					return FinalSolution();
				}else{
					return "On the computer in the rocketry room, there is a section entitled 'Regulus data'." +
						" Within this section is a grid of circles and a list of prime numbers under 50." +
						" On the control console in the chamber underground, there is a screen with a spiral grid" +
						" of integers. Arrange the grid so that all, and only, the prime numbers are highlighted." +
						" The prime numbers are 2-3-5-7-11-13-17-19-23-29-31-37-41-43-47.";
				}
			}else{
				return "On the computer in the rocketry room, there is a section entitled 'Regulus data'." +
					" Within this section is a grid of circles and a list of prime numbers under 50." +
					" On the control console in the chamber underground, there is a screen with a spiral grid" +
					" of integers. Arrange the grid so that all, and only, the prime numbers are highlighted." +
					" The prime numbers are 2-3-5-7-11-13-17-19-23-29-31-37-41-43-47.";
			}
							
			
		}
		
		private function FinalSolution():String{
			return "There are not any solutions.";
		}
		
	}
	
}

