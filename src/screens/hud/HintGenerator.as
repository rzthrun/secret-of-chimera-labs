package screens.hud
{
	public class HintGenerator
	{
		private var game:Game;
		private var rand:Boolean = false;
		
		public function HintGenerator(_game:Game)
		{
			game = _game;
		}
		public function GetHint():String{
			if(game.SavedGame.SavedGameObj.data.CurrentRoomClass != undefined){
				return ExteriorHints();
			}else{
				return "You Just Got This hint!";
			}
			
			
			
		}
		
		private function ExteriorHints():String{
			if(game.SavedGame.SavedGameObj.data.Exterior != undefined){
				if(game.SavedGame.SavedGameObj.data.Exterior['DoorUnlocked'] == 'Yes'){
					
					return ManagementDoorHint();
				}else{
					if(game.SavedGame.SavedGameObj.data.ExteriorGrate != undefined){							
						return ExteriorHintsBUNDLER00();
					}else{
						return ExteriorHintsBundler01();
					}
				}
			}else{
				if(game.SavedGame.SavedGameObj.data.ExteriorGrate != undefined){						
					return ExteriorHintsBUNDLER00();
					
				}else{
					return ExteriorHintsBundler01();
				}
			}				
		}
		
		private function ExteriorHintsBUNDLER00():String{
			if(game.SavedGame.SavedGameObj.data.ExteriorGrate['Keys'] == 'PickedUp'){	
				if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'Exterior'){
					return "Try using the key card to open the front door.";
				}else{
					return "Look around for a place to use the key card.";
				}
				
			}else{
				return ExteriorHintsBundler01();
			}
		}
		
		private function ExteriorHintsBundler01():String{
			if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'ExteriorGrate'){
				return "Try picking up the object in the drain.";
			}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'ExteriorRear'){
				return "There's something useful nearby. Look around.";
			}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'ExteriorRearDumpster'){
				return "There's something useful nearby. Look around.";
			}else{
				return "Explore the area, try to find a way into the building...";
			}
		}
		
		private function ManagementDoorHint():String{
			if(game.SavedGame.SavedGameObj.data.Lobby != undefined){
				if(game.SavedGame.SavedGameObj.data.Lobby['OfficeDoor'] == 'open'){
					return ComboLockDialHint();
				}else{
					return ManagementBUNDLE01();
				}
			}else{
				return ManagementBUNDLE01();
			}
			
		}
		
		private function ManagementBUNDLE01():String{
			if(game.SavedGame.SavedGameObj.data.LobbyComputer != undefined){
				if(game.SavedGame.SavedGameObj.data.LobbyComputer['mgnt'] == 'Yes'){
					if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'Lobby'){
						return "Try opening the door on the left.";
					}else{
						return "Look around to find out what you've been able to unlock.";
					}
				}else{
					return ManagementBUNDLE00();
				}
			}else{
				return ManagementBUNDLE00();
			}
		}
		
		private function ManagementBUNDLE00():String{
			if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'LobbyComputer'){
				return "This computer program can unlock several doors here in the lobby.";
			}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'LobbyDesk'){
				return "Maybe the computer has something useful...";
			}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'Lobby'){
				return "Try taking a closer look at the front desk.";
			}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'LobbyCounter'){
				return "Maybe the computer has something useful...";
			}else{
				return "Look around... See what you can find!";
			}
		}
		
		private function ComboLockDialHint():String{
			if(game.SavedGame.SavedGameObj.data.DirLock != undefined){
				if(game.SavedGame.SavedGameObj.data.DirLock['Solved'] == 'Yes'){
					return BathroomDoorHint();
				}else{
					if(game.SavedGame.SavedGameObj.data.DirLock['KnobAttached'] == 'Yes'){
						if(game.SavedGame.SavedGameObj.data.SecondFloorPainting != undefined){
							if(game.SavedGame.SavedGameObj.data.SecondFloorPainting['SeenIt'] == 'Yes'){
								if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'DirLock'){
									return "Try comparing this lock with the nearby painting...";
								}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'SecondFloorHall'){
									return "It's possible to solve the lock chaining the door shut. Look nearby for clues.";
								}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'SecondFloorPainting'){
									return "This painting and the nearby lock are similar in some ways.";
								}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'SecondFloorCart'){
									return "Look nearby for clues to help solve the lock on the door.";
								}else{
									return "Search for clues to help open the door on the second floor...";
								}
							}else{
								if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'DirLock'){
									return "Try looking nearby for clues.";
								}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'SecondFloorHall'){
									return "Try looking nearby for clues to help with the door.";
								}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'SecondFloorCart'){
									return "Try looking nearby for clues to help with the door.";
								}else{
									return "Try looking nearby for clues.";
								}
							}
						}else{
							trace("NERD 00");
							return ComboLockDailBUNDLE00();
						}
					}else{
						if(game.SavedGame.SavedGameObj.data.DirLock['KnobAttached'] == 'Yes'){
							return ComboLockDailBUNDLE00();
							trace("NERD 03");
						}else{
							return CombLockDialBUNDLE02()
							trace("NERD 01");
						}
					}
				}
			}else{
				trace("NERD 02");
				return CombLockDialBUNDLE02();
			}
			
		}
		
		private function CombLockDialBUNDLE02():String{
			if(game.SavedGame.SavedGameObj.data.BuildingOfficeDesk != undefined){
				if(game.SavedGame.SavedGameObj.data.BuildingOfficeDesk['Knob'] == 'PickedUp'){
					if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'DirLock'){
						return "Try using an inventory item with the lock on the door.";
					}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'SecondFloorHall'){
						return "Try using an inventory item with the lock on the door.";
					}else{
						return "Look around for a place to use the brass knob found in the copy room.";
					}
				}else{
					return ComboLockDailBUNDLE01();
				}
			}else{
				return ComboLockDailBUNDLE01();
			}
		}
		
		private function ComboLockDailBUNDLE00():String{
			if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'DirLock'){
				return "Try looking nearby for clues.";
			}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'SecondFloorHall'){
				return "Try looking nearby for clues to help with door.";
			}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'SecondFloorCart'){
				return "Try looking nearby for clues to help with the door.";
			}else{
				return "Search the building for clues...";
			}
		}
		
		private function ComboLockDailBUNDLE01():String{
			if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'BuildingOfficeDesk'){
				return "Try searching the desk for useful clues and items.";
			}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'BuildingOffice'){
				return "There are items and clues to find and discover in this room.";
			}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'BuildingOfficeCopier'){
				return "There's an item to find nearby.";
			}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'BuildingOfficeShapePuzzle'){
				return "There's an item to find nearby.";
			}else{
				return "There's an item that can be picked up. Search the building.";
			}
		}
		
		private function BathroomDoorHint():String{
			if(game.SavedGame.SavedGameObj.data.OfficeKitchen != undefined){	
				if(game.SavedGame.SavedGameObj.data.OfficeKitchen['Door'] == 'Open'){
					return ProgramSplatControllerHint();
				}else{
					if(game.SavedGame.SavedGameObj.data.OfficeKitchen['SlimeCleaned'] == 'Yes'){
						if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'OfficeKitchen'){
							return "Try opening the door.";
						}else{
							return "A new area can be explored.";
						}						
					}else if(game.SavedGame.SavedGameObj.data.OfficeKitchen['SlimeSoaped'] == 'Yes'){
						if(game.SavedGame.SavedGameObj.data.SecondFloorCart != undefined){
							if(game.SavedGame.SavedGameObj.data.SecondFloorCart['paperTowels'] == 'PickedUp'){
								if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'OfficeKitchen'){
									return "Try to remove the slime and soap from the door handle.";
								}else{
									return "Look around for a place where the paper towels could be useful.";
								}	
							}else{
								return BathroomDoorBUNDLEOO();
							}
						}else{
							return BathroomDoorBUNDLEOO();
						}
					}else{
						return BathroomDoorBUNDLE01();
					}
				}
			}else{
				return BathroomDoorBUNDLE01();
			}
			
		}
		
		private function BathroomDoorBUNDLE01():String{
			if(game.SavedGame.SavedGameObj.data.SecondFloorCart != undefined){
				if(game.SavedGame.SavedGameObj.data.SecondFloorCart['spraycan'] == 'PickedUp'){
					if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'OfficeKitchen'){
						return "Try using the spray bottle of cleaning fluid...";
					}else{
						return "Look around for a place where the spray bottle of cleaning fluid can be used.";
					}	
				}else{
					return BathroomBUNDLE02();
				}
			}else{
				return BathroomBUNDLE02();
			}
		}
		private function BathroomBUNDLE02():String{
			if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'SecondFloorCart'){
				return "Why not pick up the spray bottle?";
			}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'SecondFloor'){
				return "There is an item nearby that can be picked up.";
			}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'SecondPainting'){
				return "There is an item nearby that can be picked up.";
			}else{
				return "Search the building for items that may be of assistance.";
			}
		}
		
		private function BathroomDoorBUNDLEOO():String{
			if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'SecondFloorCart'){
				return "Why not pick up the paper towels?";
			}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'SecondFloor'){
				return "There is an item nearby that can be picked up.";
			}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'SecondPainting'){
				return "There is an item nearby that can be picked up.";
			}else{
				return "Search the building for items that may be of assistance.";
			}
		}
		
		private function ProgramSplatControllerHint():String{
			if(game.SavedGame.SavedGameObj.data.OfficeSplatComputer != undefined){
				if(game.SavedGame.SavedGameObj.data.OfficeSplatComputer['SplatProgrammed'] == 'Yes'){
					return BugWireHint();
				}else{
					return ProgramSlatControllerBUNDLE03();
					
				}
			}else{
				return ProgramSlatControllerBUNDLE03();
			}
			
			
			
		}
		
		private function ProgramSlatControllerBUNDLE03():String{
			if(game.SavedGame.SavedGameObj.data.OfficeProgrammer != undefined){
				if(game.SavedGame.SavedGameObj.data.OfficeProgrammer['Controller'] == 'Attached'){
					if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'OfficeSplatComputer'){
						return "This computer program can install SPLAT software onto the micro-controller.";
					}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'OfficeProgrammer'){
						return "This computer can be helpful. Try using it.";
					}else{	
						return "Look around. There are things that can be accomplished.";
					}
					
				}else{
					return ProgramSplatControllerBUNDLE02();
				}
			}else{
				return ProgramSplatControllerBUNDLE02();
			}
		}
		
		private function ProgramSplatControllerBUNDLE02():String{
			if(game.SavedGame.SavedGameObj.data.BuildingOfficeDesk != undefined){
				if(game.SavedGame.SavedGameObj.data.BuildingOfficeDesk['Fuse'] == 'PickedUp'){
					if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'OfficeProgrammer'){
						return "Try using an item with the machine on the desk."
					}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'Office'){
						return "There's a place to use an item nearby."
					}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'OfficeSplatComputer'){
						return "There's a place to use an item nearby."
					}else{
						if(game.SavedGame.SavedGameObj.data.OfficeCircuit != undefined){	
							if(game.SavedGame.SavedGameObj.data.OfficeCircuit['Controller'] == 'Attached'){	
								return "You may have overlooked something about the micro-controller. Try putting it somewhere else."
							}else{
								return "Look around - there are things to do."
							}
						}else{
							return "Look around - there are things to do."
						}
					}
				}else{
					return ProgramSplatControllerBUNDLE01();
				}
			}else{
				return ProgramSplatControllerBUNDLE01();
			}
		}
		
		private function ProgramSplatControllerBUNDLE01():String{
			if(game.SavedGame.SavedGameObj.data.BuildingOfficeDesk != undefined){
				if(game.SavedGame.SavedGameObj.data.BuildingOfficeDesk['Box'] == 'open'){
					if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'BuildingOfficeDesk'){
						return "There's an item in the box. Why not pick it up?"
					}else{
						return ProgramSplatControllerBUNDLE00();
					}
				}else{
					if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'BuildingOfficeDesk'){
						return "Have a look in the box on the desk."
					}else{
						return ProgramSplatControllerBUNDLE00();
					}
				}
			}else{
				if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'BuildingOfficeDesk'){
					return "Have a look in the box on the desk."
				}else{
					return ProgramSplatControllerBUNDLE00();
				}
			}
		}
		
		
		private function ProgramSplatControllerBUNDLE00():String{
			if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'BuildingOffice'){
				return "Look around this room. There's an item to find."
			}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'BuildingOfficeCopier'){
				return "Look around this room. There's an item to find."
			}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'BuildingOfficeShapePuzzle'){
				return "Look around this room. There's an item to find."
			}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'BuildingOfficePushBox'){
				return "Look around this room. There's an item to find."
			}else{
				return "Search the building. There are items to find."
			}
		}
		
		
		private function BugWireHint():String{
			if(game.SavedGame.SavedGameObj.data.OfficeBugWire != undefined){
				if(game.SavedGame.SavedGameObj.data.OfficeBugWire['Solved'] === 'Yes'){
					return CarDoorHint();
				}else{
					return BugWireBUNDLE01();
				}
			}else{
				return BugWireBUNDLE01();
			}
			
			
		}
		
		private function BugWireBUNDLE01():String{
			if(game.SavedGame.SavedGameObj.data.OfficeCircuit != undefined){						
				if(game.SavedGame.SavedGameObj.data.OfficeCircuit['Controller'] == 'Attached'){	
					if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'OfficeBugWire'){
						return "Try to find a way to make sense of this jumble of wires.";
					}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'OfficeDesk'){
						return "There are clues nearby that can help solve the spider robot circuitry puzzle.";
					}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'OfficeCircuit'){
						return "Study the spider robot circuitry and compare with other nearby clues.";
					}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'Office'){
						return "Study the spider robot circuitry.";
					}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'OfficeProgrammer'){
						return "There's a clue here that can help solve the spider robot circuitry puzzle.";
					}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'OfficeDraftsman'){
						return "There are clues nearby that can help solve the spider robot circuitry puzzle.";
					}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'OfficeKitchen'){
						return "There are clues nearby that can help solve the spider robot circuitry puzzle.";
					}else{
						return "There are things that can be accomplished. Look around and see what you can solve and discover...";
					}
				}else{
					return BugWireBUNDLE00();
					
				}
			}else{
				return BugWireBUNDLE00();
			}
		}
		
		private function BugWireBUNDLE00():String{
			if(game.SavedGame.SavedGameObj.data.OfficeProgrammer != undefined){
				if(game.SavedGame.SavedGameObj.data.OfficeProgrammer['Controller'] == 'Attached'){
					if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'OfficeProgrammer'){
						return "The micro-controller in the machine has a program installed.";
					}else{
						return "There's an item in the second floor office that can be picked up.";
					}
				}else{
					if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'OfficeBugWire'){
						return "The spider robot's motor control seems to be missing a piece.";
					}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'OfficeDesk'){
						return "Take a closer look at the spider robot on the desk.";
					}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'OfficeCircuit'){
						return "Take a closer look at the spider robot on the desk. Try using an item.";
					}else{
						return "The microcontroller can be put good use - try to discover where.";
					}
				}
			}else{
				return "No hint available at this time.";
			}
			
		}
		
		private function CarDoorHint():String{
			if(game.SavedGame.SavedGameObj.data.ExteriorRear != undefined){
				if(game.SavedGame.SavedGameObj.data.ExteriorRear['CarFrontUnlocked'] == 'Yes'){
					return VentHint();
				}else{
					return CarDoorBUNDLE01();
				}
			}else{
				return CarDoorBUNDLE01();
			}
			
		}
		
		private function CarDoorBUNDLE01():String{
			if(game.SavedGame.SavedGameObj.data.OfficeCircuit != undefined){	
				if(game.SavedGame.SavedGameObj.data.OfficeCircuit['Screwdriver'] == 'PickedUp'){
					if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'ExteriorRear'){
						return "Maybe see if the car keys are any use on the van."
					}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'Exterior'){
						return "Look behind the building some more..."
					}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'ExteriorGrate'){
						return "Something can be unlocked nearby..."
					}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'ExteriorDumpster'){
						return "Something can be unlocked nearby..."
					}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'ExteriorFireEscape'){
						return "Something can be unlocked below..."
					}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'ExteriorFireUpper'){
						return "Something can be unlocked below..."
					}else{
						return "New places can be unlocked. Remember where you've been."
					}
				}else{
					if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'OfficeCircuit'){
						return "Why not pick up the car keys on the desk?"
					}else{
						return CarDoorBUNDLE00();
					}
				}
			}else{
				return "No hint at this time";
			}
		}
		
		
		private function CarDoorBUNDLE00():String{
			if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'Office'){
				return "There's an item in this room that can be picked up.";
			}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'OfficeDesk'){
				return "There's an item nearby that can be picked up.";
			}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'OfficeDraftsman'){
				return "There's an item nearby that can be picked up.";
			}else{
				return "There's an item that can be picked up.  Search for it.";
			}
		}
		
		
		/*
		
		*/
		
		private function VentHint():String{
			if(game.SavedGame.SavedGameObj.data.Bathroom != undefined){	
				if(game.SavedGame.SavedGameObj.data.Bathroom['VentUnlocked'] == 'Yes'){	
					return SplatHint();
				}else{
					return VentHintBUNDLE01();
				}
			}else{
				return VentHintBUNDLE01();
			}
			
		}
		
		private function VentHintBUNDLE01():String{
			if(game.SavedGame.SavedGameObj.data.ExteriorCarFront != undefined){	
				if(game.SavedGame.SavedGameObj.data.ExteriorCarFront['Card'] == 'PickedUp'){	
					if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'Bathroom'){
						return "Try using the screwdriver on the vent here.";
					}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'BathroomCabinent'){
						return "There's a place nearby to use the screwdriver.";
					}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'BathroomWall'){
						return "There's a place nearby to use the screwdriver.";
					}else{
						return "Something can be done on the second floor...";
					}
				}else{
					if(game.SavedGame.SavedGameObj.data.ExteriorCarFront['KeysAttached'] == 'Yes'){	
						if(game.SavedGame.SavedGameObj.data.ExteriorCarFront['GloveBox'] != undefined){
							if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'ExteriorCarFront'){
								return "Why not pick up the screwdriver from the glove box.";
							}else{
								return "There's an item that can be picked up.";
							}
						}else{
							if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'ExteriorCarFront'){
								return "Try twisting the keys or opening the glove box...";
							}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'ExteriorRear'){
								return "Maybe have another look inside the van.";
							}else{
								return "There's more to discover in the van...";
							}
						}
					}else{
						return VentHintBUNDLE00();
					}
				}
			}else{
				return VentHintBUNDLE00();
			}
		}
		
		private function VentHintBUNDLE00():String{
			if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'ExteriorCarFront'){
				return "Try turning the van's engine or electric system on."
			}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'ExteriorRear'){
				return "Take a closer look at the van."
			}
			else{
				return "There's more to discover. Keep looking.";
			}
		}
		
		private function SplatHint():String{
			if(game.SavedGame.SavedGameObj.data.BathroomDuctExit != undefined){
				if(game.SavedGame.SavedGameObj.data.BathroomDuctExit['GrateUnlocked'] == 'Yes'){
					return ElectricBoxHint();	
				}else{
					return SplatHintBUNDLE00();
				}
			}else{
				return SplatHintBUNDLE00();
			}
			
		}
		
		private function SplatHintBUNDLE00():String{
			if(game.SavedGame.SavedGameObj.data.OfficeCircuit != undefined){	
				if(game.SavedGame.SavedGameObj.data.OfficeCircuit['Spider'] == 'PickedUp'){	
					if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'BathroomDuctExit'){
						return "See if the spider robot can help here.";
					}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'BathroomDuct'){
						return "There's a place nearby where the spider robot can help...";
					}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'BathroomDuctFan'){
						return "There's a place nearby where the spider robot can help...";
					}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'Bathroom'){
						return "There's a place nearby where the spider robot can help.";
					}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'BathroomWall'){
						return "Look more closely at the vent to your right.";
					}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'BathroomCabinet'){
						return "Look more closely at the vent to your right.";
					}else{
						return "There's something to investigate on the second floor...";
					}
				}else{
					if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'Office'){
						return "There's something on one of the desks that can be picked up?";
					}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'OfficeCircuit'){
						return "Why not pick up the spider robot on the desk?";
					}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'OfficeDesk'){
						return "Why not pick up the spider robot on the desk?";
					}else{
						return "There's an item that can be picked up.";
					}
					
				}
			}else{
				return "No hint available at this time.";
			}
		}
		
		private function ElectricBoxHint():String{
			if(game.SavedGame.SavedGameObj.data.ElectricBoxSmall != undefined){
				if(game.SavedGame.SavedGameObj.data.ElectricBoxSmall['Solved'] == 'Yes'){
					return BigElectricBoxHint();
				}else{
					return ElectricBoxBUNDLE01();
				}
			}else{
				return ElectricBoxBUNDLE01();
			}
			
			
		}
		
		private function ElectricBoxBUNDLE01():String{
			if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'ElectricBoxSmall'){
				return "The electrical current needs to flow through the entire grid.";
			}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'ServerRoom'){
				return "Try to get the electrical power working in this room...";
			}else{
				return "There's something to do in the server room on the second floor.";
			}
		}
		
		
		
		private function BigElectricBoxHint():String{
			if(game.SavedGame.SavedGameObj.data.ElectricBox != undefined){
				if(game.SavedGame.SavedGameObj.data.ElectricBox['Solved'] == 'Yes'){
					return EggplantHint();
				}else{
					return BigElectricBoxHintBUNDLE00();
				}
			}else{
				return BigElectricBoxHintBUNDLE00();
			}
			
		}
		
		private function BigElectricBoxHintBUNDLE00():String{
			if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'ElectricBox'){
				return "The electrical current needs to flow through the entire grid.";
			}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'ServerRoom'){
				return "Inspect the breaker box in the corner of the room.";
			}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'ServerRoomTable'){
				return "Inspect the breaker box in the corner of the room.";
			}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'ServerRoomComputer'){
				return "Inspect the breaker box in the corner of the room.";
			}else{
				return "There's something to do in the server room on the second floor.";
			}
		}
		
		
		private function EggplantHint():String{
			if(game.SavedGame.SavedGameObj.data.ServerRoomTable != undefined){	
				if(game.SavedGame.SavedGameObj.data.ServerRoomTable['EggplantAttached'] == 'Yes'){	
					return ShapePuzzleHint();
				}else{
					return EggplantBUNDLE01();
				}
			}else{
				return EggplantBUNDLE01();
			}	
			
		}
		
		
		private function EggplantBUNDLE01():String{
			if(game.SavedGame.SavedGameObj.data.OfficeKitchen != undefined){	
				if(game.SavedGame.SavedGameObj.data.OfficeKitchen['FridgeOpen'] != undefined){	
					if(game.SavedGame.SavedGameObj.data.OfficeKitchen['Eggplant'] == 'PickedUp'){	
						if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'ServerRoom'){
							return "An item can be used in this room.";
						}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'ServerRoomComputer'){
							return "An item can be used in this room.";
						}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'ServerRoomTable'){
							return "Try adding the eggplant to the group of objects on the table.";
						}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'ServerRoomPal'){
							return "An item can be used in this room.";
						}else{
							return "Look around for a place to use the eggplant.";
						}
					}else{
						return EggplantBUNDLE00();
					}
				}else{
					return EggplantBUNDLE00();
				}
			}else{
				return "No hint at this time."
			}
		}
		
		private function EggplantBUNDLE00():String{
			if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'OfficeKitchen'){
				return "Take a look in the mini-fridge.";
			}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'OfficeKitchenSink'){
				return "An item can be picked up in this room.";
			}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'Office'){
				return "An item can be picked up in this room.";
			}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'OfficeDesk'){
				return "An item can be found in this room.";
			}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'OfficeCircuit'){
				return "An item can be picked up in this room.";
			}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'OfficeDraftsman'){
				return "An item can be discovered in this room.";
			}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'OfficeProgrammer'){
				return "An item can be picked up in this room.";
			}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'OfficeCircuit'){
				return "An item can be picked up in this room.";
			}else{
				return "An item can be found. Look around the second floor office."
			}
		}
		
		private function ShapePuzzleHint():String{
			if(game.SavedGame.SavedGameObj.data.BuildingOfficeShapePuzzle != undefined){
				if(game.SavedGame.SavedGameObj.data.BuildingOfficeShapePuzzle['Solved'] == 'Yes'){
					return UnlockElevatorHint();
				}else{
					return ShapePuzzleBUNDLE02();
				}
			}else{
				return ShapePuzzleBUNDLE02();
			}
			
		}
		
		private function ShapePuzzleBUNDLE02():String{
			if(game.SavedGame.SavedGameObj.data.ServerRoomTable != undefined){	
				if(game.SavedGame.SavedGameObj.data.ServerRoomTable['3'] != undefined){	
					if(game.SavedGame.SavedGameObj.data.ServerRoomTable['3'] == 'cylinder'){	
						if(game.SavedGame.SavedGameObj.data.OfficeComputer != undefined){
							return ShapePuzzleBUNDLE00();
						}else{
							return ShapePuzzleBUNDLE01();
						}
					}else{
						
						if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'ServerRoomTable'){
							return "Try different arrangements of the objects on the table...";
						}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'ServerRoomPal'){
							return "Study the arrangement of objects on the screen. See how the computer's viewpoint is different from your own.";
						}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'ServerRoomComputer'){
							return "Have another look at the objects on the table.";								
						}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'ServerRoom'){
							return "Have another look at the objects on the table.";
						}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'BuildingOfficeShapePuzzle'){
							return "Red, Blue, Purple, Green, Orange... but no Yellow...";	
						}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'BuildingOffice'){	
							return "Maybe the answer to opening a door in this room can be found elsewhere...";	
						}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'BuildingOfficeDesk'){
							return "Maybe the answer to opening a door in this room can be found elsewhere...";		
						}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'BuildingOfficePushBox'){
							return "Maybe the answer to opening a door in this room can be found elsewhere...";		
						}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'BuildingOfficeCopier'){
							return "Maybe the answer to opening a door in this room can be found elsewhere...";		
						}else{
							return "There's something to be done in the server room...";
						}
					}
				}else{
					if(game.SavedGame.SavedGameObj.data.OfficeComputer != undefined){
						return ShapePuzzleBUNDLE00();
					}else{
						return ShapePuzzleBUNDLE01();
					}
				}
			}else{
				return "No hint at this time.";	
			}
		}
		
		private function ShapePuzzleBUNDLE01():String{
			if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'Office'){
				return "There's information in this room that could be very useful. Try studying the computers...";
			}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'OfficeDesk'){
				return "There's useful information in this room. Try studying the computers...";
			}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'OfficeDraftsman'){
				return "Maybe look at the computer.";
			}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'OfficeCircuit'){
				return "Try looking at another desk.";
			}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'OfficeComputer'){
				return "The shapes and symbols shown in the 'PAL' section of this computer correspond to the objects on the table in the server room" +
					" and the buttons on the heavy door lock in the ground floor office."
			}else{
				return ShapePuzzleBUNDLE00();
			}
		}
		
		private function ShapePuzzleBUNDLE00():String{
			
			if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'ServerRoomTable'){
				return "Try to imagine the way the items on the table would look through the eye of the large computer in the center of the room.";
			}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'ServerRoomPal'){
				return "Something can be learned from the computer optical video feed.";
			}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'ServerRoomComputer'){
				return "The computer holds a clue that could be of assistance now.";								
			}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'ServerRoom'){
				return "Study the relationship between the items on the table, and the computer. Important information can be discovered there.";	
			}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'BuildingOfficeShapePuzzle'){
				return "The shapes and colors here are similar to those of the items on the table in the server room.";	
			}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'BuildingOffice'){	
				return "A door in this room can be unlocked...";	
			}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'BuildingOfficeDesk'){
				return "A door in this room can be unlocked...";	
			}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'BuildingOfficePushBox'){
				return "A door in this room can be unlocked...";	
			}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'BuildingOfficeCopier'){
				return "A door in this room can be unlocked...";	
			}else{
				return "There's a door on the ground floor that can be opened.";
			}
		}
		
		
		private function UnlockElevatorHint():String{
			if(game.SavedGame.SavedGameObj.data.LobbyComputer != undefined){
				if(game.SavedGame.SavedGameObj.data.LobbyComputer['elevator'] == 'Yes'){
					return ElevatorPanelHints();
				}else{
					if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'LobbyComputer'){
						return "The elevator can be unlocked using this program.";
					}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'LobbyDesk'){
						return "Take another look at the computer.";
					}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'LobbyCounter'){
						return "Maybe the computer can be helpful.";
					}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'Lobby'){
						return "Take a look around the security booth.";
					}else{
						return "See what can be done in the lobby...";
					}
				}
			}else{
				return "No hint at this time.";
			}
			
		}
		
		private function ElevatorPanelHints():String{
			if(game.SavedGame.SavedGameObj.data.Elevator != undefined){
				if(game.SavedGame.SavedGameObj.data.Elevator['FusePanelUnlocked'] == 'Yes'){
					return GreenFuseHints();
				}else{					
					return ElevatorPanelBUNDLE();
				}
			}else{
				return ElevatorPanelBUNDLE();
			}
			
		}
		private function ElevatorPanelBUNDLE():String{
			if(game.SavedGame.SavedGameObj.data.BuildingOfficeDesk != undefined){
				if(game.SavedGame.SavedGameObj.data.BuildingOfficeDesk['AllenWrench'] == 'PickedUp'){
					if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'Elevator'){
						return "Try using the allen wrench on the lower elevator panel.";
					}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'Panel'){
						return "The allen wrench can be used near here.";
					}else{
						return "Try taking a look at the elevator...";
					}
				}else{
					if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'BuildingOfficeDesk'){
						return "Why not take a look in the desk drawers here?";
					}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'BuildingOffice'){
						return "Look around this room. There's an item to find."
					}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'BuildingOfficeCopier'){
						return "Look around this room. There's an item to find."
					}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'BuildingOfficeShapePuzzle'){
						return "Look around this room. There's an item to find."
					}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'BuildingOfficePushBox'){
						return "Look around this room. There's an item to find."
					}else{
						return "Keep looking throughout the building. There are items to find."
					}
				}
			}else{
				return "No hint at this time.";
			}
		}
		
		private function GreenFuseHints():String{
			if(game.SavedGame.SavedGameObj.data.ElevatorFuse != undefined){
				if(game.SavedGame.SavedGameObj.data.ElevatorFuse['GreenAttached'] == 'Yes'){
					return RedFuseHint();
				}else{
					if(game.SavedGame.SavedGameObj.data.LobbyCounter != undefined){	
						if(game.SavedGame.SavedGameObj.data.LobbyCounter['Fuse'] == 'PickedUp'){	
							if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'ElevatorPanel'){
								return "There's a place to use an item in here.";
							}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'ElevatorFuse'){
								return "See if the fuse fits anywhere on this circuit panel.";
							}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'Elevator'){
								return "Take another look at the lower elevator panel.";
							}else{
								return "See what can be done in the elevator...";
							}
						}else{
							return GreenFuseBUNDLE00(); 
						}
					}else{
						return GreenFuseBUNDLE00(); 
					}					
				}
			}else{
				return GreenFuseBUNDLE01();	
			}
			
		}
		
		private function GreenFuseBUNDLE01():String{
			if(game.SavedGame.SavedGameObj.data.LobbyCounter != undefined){	
				if(game.SavedGame.SavedGameObj.data.LobbyCounter['Fuse'] == 'PickedUp'){	
					if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'ElevatorPanel'){
						return "There's a place to use an item in here.";
					}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'ElevatorFuse'){
						return "See if the fuse fits anywhere on this circuit panel.";
					}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'Elevator'){
						return "Take another look at the lower elevator panel.";
					}else{
						return "See what can be done in the elevator...";
					}
				}else{
					return GreenFuseBUNDLE00(); 
				}
			}else{
				return GreenFuseBUNDLE00(); 
			}					
		}
		
		private function GreenFuseBUNDLE00():String{
			if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'LobbyCounter'){
				return "There's an item here that can be picked up.";
			}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'LobbyDesk'){
				return "There's an item nearby that can be picked up.";
			}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'LobbyComputer'){
				return "There's an item nearby that can be picked up.";
			}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'Lobby'){
				return "See what you can find behind the security desk.";
			}else{
				return "There's an item to find... look around.";
			}
		}
		
		
		private function RedFuseHint():String{
			if(game.SavedGame.SavedGameObj.data.ElevatorFuse != undefined){
				if(game.SavedGame.SavedGameObj.data.ElevatorFuse['RedAttached'] == 'Yes'){
					return BlueFuseHint();
				}else{
					if(game.SavedGame.SavedGameObj.data.RoboticsBody != undefined){	
						if(game.SavedGame.SavedGameObj.data.RoboticsBody['Controller'] == 'PickedUp'){	
							if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'ElevatorPanel'){
								return "There's a place to use an item in here.";
							}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'ElevatorFuse'){
								return "See if the fuse fits anywhere on this circuit panel.";
							}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'Elevator'){
								return "Take another look at the lower elevator panel.";
							}else{
								return "See what can be done in the elevator...";
							}
						}else{
							return RedFuseBUNDLE00();
						}
					}else{
						return RedFuseBUNDLE00();
					}
				}
			}else{
				return "No hint at this time.";
			}
			
		}
		
		private function RedFuseBUNDLE00():String{
			if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'RoboticsBody'){
				return "Why not pick up the red fuse?";
			}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'RoboticsDesk'){
				return "Take a closer look at the desk...";
			}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'RoboticsRoom'){
				return "There's an item to find in this room.";
			}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'RoboticsRoomKoma'){
				return "There's an item to find in this room.";
			}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'RoboticsRoomKomaPuzzle'){	
				return "There's an item to find in this room.";
			}else{
				return "There's more to find! Continue your investigation...";
			}
		}
		
		private function BlueFuseHint():String{
			if(game.SavedGame.SavedGameObj.data.ElevatorFuse != undefined){
				if(game.SavedGame.SavedGameObj.data.ElevatorFuse['BlueAttached'] == 'Yes'){
					return ElevatorFuseHint();
				}else{
					if(game.SavedGame.SavedGameObj.data.OfficeCircuit != undefined){	
						if(game.SavedGame.SavedGameObj.data.OfficeCircuit['Lid'] != undefined){	
							if(game.SavedGame.SavedGameObj.data.OfficeCircuit['Fuse'] == 'PickedUp'){	
								if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'ElevatorPanel'){
									return "There's a place to use an item in here.";
								}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'ElevatorFuse'){
									return "See if the fuse fits anywhere on this circuit panel.";
								}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'Elevator'){
									return "Take another look at the lower elevator panel.";
								}else{
									return "See what can be done in the elevator...";
								}
							}else{
								if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'OfficeCircuit'){
									return "Why not pick up what's inside the toolbox."
								}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'OfficeDesk'){
									return "Take a closer look at the tool box."
								}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'Office'){
									return "Take a closer look at the work bench."
								}else {
									return "There are more items to find. Look around the office."
								}
							}
						}else{
							if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'OfficeCircuit'){
								return "Why not look inside the toolbox?"
							}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'OfficeDesk'){
								return "Take a closer look at the tool box."
							}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'Office'){
								return "Take a closer look at the tool box on the center desk.."
							}else {
								return "There are more items to find. Look around the office."
							}
						}
					}else{
						return "No hint at this time.";
					}
				}
			}else{
				return "No hint at this time.";
			}
			
		}
		
		private function ElevatorFuseHint():String{
			if(game.SavedGame.SavedGameObj.data.ElevatorFuse != undefined){
				if(game.SavedGame.SavedGameObj.data.ElevatorFuse['Solved'] == 'Yes'){
					//	return BathroomMirrorHint();
					return UnlockDiagnosticHint();
				}else{
					if(game.SavedGame.SavedGameObj.data.OfficeKitchen != undefined){	
						if(game.SavedGame.SavedGameObj.data.OfficeKitchen["Book"] != undefined){
							if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'ElevatorFuse'){
								return "Try to get each of the three fuse color groups to equal the same amount.";
							}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'Elevator'){
								return "It's possible to repair the elevator's circuit box.";
							}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'ElevatorPanel'){
								return "It's possible to repair the elevator's circuit box.";
							}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'OfficeKitchen'){
								return "The sheets on the table can help with the elevator's circuit box.";
							}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'OfficeKitchenSink'){	
								return "There's information in the room that can help repair the elevator.";
							}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'OfficeDesk'){
								return "There's information in the room that can help repair the elevator.";
							}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'OfficeCircuit'){
								return "There's information in the room that can help repair the elevator.";
							}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'OfficeDraftsman'){
								return "There's information in the room that can help repair the elevator";
							}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'OfficeAdimm'){
								return "There's information in the room that can help repair the elevator";
							}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'OfficeProgrammer'){	
								return "There's information in the room that can help repair the elevator.";								
							}else{
								return "It's possible to repair the elevator. See what you can do...";
							}
						}else{
							if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'ElevatorFuse'){
								return "Look around the building for clues to help with this puzzle.";
							}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'Elevator'){
								return "Look around the building for clues to help with elevator's circuit box.";
							}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'ElevatorPanel'){
								return "Look around the building for clues to help with elevator's circuit box.";
							}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'OfficeKitchen'){
								return "The sheets on the table can help with elevator's circuit box.";
							}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'OfficeKitchen'){
								return "There's information in the room that can help repair the elevator.";
							}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'OfficeKitchenSink'){	
								return "There's information in the room that can help repair the elevator.";
							}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'OfficeDesk'){
								return "There's information in the room that can help repair the elevator.";
							}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'OfficeCircuit'){
								return "There's information in the room that can help repair the elevator.";
							}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'OfficeDraftsman'){
								return "There's information in the room that can help repair the elevator.";
							}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'OfficeAdimm'){
								return "There's information in the room that can help repair the elevator.";
							}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'OfficeProgrammer'){	
								return "There's information in the room that can help repair the elevator.";
							}else{
								return "There are more clues to discover.";
							}
						}
					}else{
						return 'No hint at this time';	
					}
				}
			}else{
				return 'No hint at this time';	
			}
			
		}
		
		
		private function UnlockDiagnosticHint():String{
			if(game.SavedGame.SavedGameObj.data.ServerRoomPal != undefined){	
				if(game.SavedGame.SavedGameObj.data.ServerRoomPal['PassCodeSolved'] == 'Yes'){
					return ProgrammerDrawerHint();
				}else{
					return UnlockDiagnosticBUNDLE02();
				}
			}else{
				return UnlockDiagnosticBUNDLE02();
			}
			
		}
		
		private function UnlockDiagnosticBUNDLE02():String{
			
			if(game.SavedGame.SavedGameObj.data.OfficeDraftsman != undefined){
				if(game.SavedGame.SavedGameObj.data.OfficeDraftsman["Book"] != undefined){
					if(game.SavedGame.SavedGameObj.data.RocketRoomDesk != undefined){	
						if(game.SavedGame.SavedGameObj.data.RocketRoomDesk["Book"] != undefined){
							if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'ServerRoomPal'){	
								return "Look around on this floor for clues to help unlock a program on this computer."
							}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'ServerRoomComputer'){
								return "The information on the post-it note can help unlock a computer program.";
							}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'ServerRoomTable'){
								return "It's possible to unlock a program on the large computer. ";
							}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'ServerRoom'){
								return "It's possible to unlock a program on the large computer. ";
							}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'OfficeDraftsman'){
								return "There are clues in the book here that can help with the large computer in the server room."
							}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'OfficeDesk'){
								return "There's a clue nearby.";
							}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'RocketRoomDesk'){
								return "The information in the book can help with the computer in the server room.";
							}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'RocketRoom'){
								return "There's a clue on the desk that can help with the computer in the server room.";
							}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'OfficeDraftsman'){
								return "The book on computers has information that can help to unlock the computer" +
									" program in the server room.";
							}else{
								return "A device in the server room can be unlocked. Look around for clues.";
							}
						}else{
							return UnlockDiagnosticBUNDLE00();
						}						
					}else{
						return UnlockDiagnosticBUNDLE00();
					}
				}else{
					return UnlockDiagnosticBUNDLE01();
				}
			}else{
				return UnlockDiagnosticBUNDLE01();
			}
			
			
		}
		
		private function UnlockDiagnosticBUNDLE01():String{
			if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'OfficeDraftsman'){
				return "Take a look in the book by the desk.."
			}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'OfficeDesk'){
				return "Take a closer look at the desk on the right.";
			}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'OfficeAdimm'){	
				return "There's a clue nearby.";
			}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'Office'){
				return "There's a clue to discover in this room.";
			}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'OfficeCircuit'){
				return "There's a clue to discover in this room.";
			}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'OfficeKitchen'){
				return "There's a clue to discover in this room.";
			}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'OfficeKitchenSink'){
				return "There's a clue to discover in this room.";
			}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'OfficeProgrammer'){
				return "There's a clue to discover in this room.";
			}else{
				return  "There are more clues to find. Continue the investigation."
			}
		}
		
		private function UnlockDiagnosticBUNDLE00():String{
			if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'RocketRoomDesk'){
				return "Try studying the book on the table.";
			}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'RocketRoom'){
				return "There's a clue nearby."
			}else{
				return "There are clues to discover. Keep searching.";
			}
		}
		
		private function ProgrammerDrawerHint():String{
			if(game.SavedGame.SavedGameObj.data.OfficeProgrammer != undefined){				
				if(game.SavedGame.SavedGameObj.data.OfficeProgrammer['DrawerUnlocked'] == 'Yes'){
					return BrokenAdimmHint();
				}else{
					
					if(game.SavedGame.SavedGameObj.data.RocketRoomDesk != undefined){	
						if(game.SavedGame.SavedGameObj.data.RocketRoomDesk['Key'] == 'PickedUp'){	
							if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'OfficeProgrammer'){
								return "See if you can unlock the file cabinet.";
							}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'Office'){
								return "There's something that can be unlocked in this room.";
							}else {
								return "There's something that can be unlocked. Keep searching.";
							}
						}else{
							return ProgrammerDrawerBUNDLE00();
						}
					}else{
						return ProgrammerDrawerBUNDLE00();
					}
				}
			}else{
				return "No hint at this time"
			}
		}
		
		private function ProgrammerDrawerBUNDLE00():String{
			if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'RocketRoomDesk'){
				return "There's a key on the table.";
			}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'RocketRoom'){
				return "There's an item to find in this room.";
			}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'RocketRoomComputerDesk'){
				return "There's an item to find in this room.";
			}else{
				return "An item can be picked up. Look around.";
			}
		}
		
		
		
		private function BrokenAdimmHint():String{
			if(game.SavedGame.SavedGameObj.data.ServerRoomComputer != undefined){
				if(game.SavedGame.SavedGameObj.data.ServerRoomComputer['CubeDamage'] == 'Attached'){
					return RunAdimmDiagnosticHint();
				}else{
					if(game.SavedGame.SavedGameObj.data.ServerRoomComputer['CubeDamage'] == 'Gone'){
						return RunAdimmDiagnosticHint();
					}else{
						return BrokenAdimmBUNDLE();						
					}
				}								
			}else{
				return BrokenAdimmBUNDLE();		
			}
		}
		
		private function BrokenAdimmBUNDLE():String{
			if(game.SavedGame.SavedGameObj.data.OfficeProgrammer != undefined){				
				if(game.SavedGame.SavedGameObj.data.OfficeProgrammer['Cube'] == 'PickedUp'){
					if(game.SavedGame.SavedGameObj.data.RoboticsBody != undefined){	
						if(game.SavedGame.SavedGameObj.data.RoboticsBody['CubeDamage'] == 'Attached'){	
							if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'RoboticsBody'){
								return "Try to find a way to repair the cube before inserting it into the android's head.";
							}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'RoboticsDesk'){
								return "Take another look at the android on the workbench.";
							}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'RoboticsRoom'){
								return "Take another look at the android in the corner of the room.";
							}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'RoboticsRoomKoma'){
								return "Take another look at the android in the corner of the room.";
							}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'RoboticsRoomKomaPuzzle'){
								return "Take another look at the android in the corner of the room.";
							}else{
								return "Return to the robotics workshop, there's something you'll need there.";
							}
						}else{
							return BrokenAdimmBUNDLE01();
						}
					}else{
						return BrokenAdimmBUNDLE01();
					}				
				}else{
					if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'OfficeProgrammer'){
						return "There's an item here that can be picked up.";
					}else{
						return "Look around there are more items to pick up.";
					}
				}
			}else{
				return "No hint at this time.";
			}
		}
		private function BrokenAdimmBUNDLE01():String{
			
			if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'ServerRoomComputer'){
				return "Try placing the cube into the machine in this computer.";
			}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'ServerRoom'){
				return "Something can be done in this room. Take a closer look at the computer.";
			}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'ServerRoomTable'){
				return "Something can be done in this room. Take a closer look at the computer.";
			}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'ServerRoomPal'){
				return "Try looking at the outside of this computer. Something can be done.";
			}else{
				return "Look around the server room, something can be done.";
			}
		}
		
		private function RunAdimmDiagnosticHint():String{
			if(game.SavedGame.SavedGameObj.data.ServerRoomPal != undefined){
				if(game.SavedGame.SavedGameObj.data.ServerRoomPal['AdimmRepaired'] == 'Yes'){
					return OpenVanRearHint();
				}else{
					if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'ServerRoomPal'){
						return "Try seeing what can be done using the 'ADIMM DIAGNOSTIC' software tool on this computer.";
					}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'ServerRoom'){
						return "The computer in this room can be used to accomplish something...";
					}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'ServerRoomTable'){
						return "The computer in this room can be used to accomplish something...";
					}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'ServerRoomComputer'){
						return "The computer in this room can be used to accomplish something...";
					}else{
						return "There's something that can be repaired.";
					}
				}
			}else{
				return "No hint at this time.";
			}
			
		}
		
		private function OpenVanRearHint():String{
			
			if(game.SavedGame.SavedGameObj.data.ExteriorRear != undefined){				
				if(game.SavedGame.SavedGameObj.data.ExteriorRear['TrunkUnlocked'] == 'Yes'){					
					return EnterGreenHouseHint();
				}else{
					if(game.SavedGame.SavedGameObj.data.RoboticsRoom != undefined){	
						if(game.SavedGame.SavedGameObj.data.RoboticsRoom['Cutters'] == 'PickedUp'){	
							return OpenVanRearBUNDLE00();
						}else{
							return OpenVanRearBUNDLE01();
						}
					}else{
						return OpenVanRearBUNDLE01();
					}
				}
			}else{
				if(game.SavedGame.SavedGameObj.data.RoboticsRoom != undefined){	
					if(game.SavedGame.SavedGameObj.data.RoboticsRoom['Cutters'] == 'PickedUp'){	
						return OpenVanRearBUNDLE00();
					}else{
						return OpenVanRearBUNDLE01();
					}
				}else{
					return OpenVanRearBUNDLE01();
				}
			}
			
		}
		
		
		
		
		private function OpenVanRearBUNDLE01():String{
			if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'RoboticsRoom'){
				return "Why not pick up the bolt-cutters on the left?";
			}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'RoboticsDesk'){
				return "There's an item to pick up in this room.";
			}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'RoboticsBody'){
				return "There's an item to pick up in this room.";
			}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'RoboticsRoomKoma'){
				return "There's an item to pick up in this room.";
			}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'RoboticsRoomKomaPuzzle'){
				return "There's an item to pick up in this room.";
			}else{
				return "There's an item to find in the robotics workshop on the ground floor.";
			}
		}
		
		private function OpenVanRearBUNDLE00():String{
			if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'ExteriorRear'){
				return "Why not try cutting the padlock off of the back of the van?";
			}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'ExteriorGrate'){
				return "Something can be unlocked nearby...";
			}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'ExteriorDumpster'){
				return "Something can be unlocked nearby...";
			}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'ExteriorCarFront'){
				return "Something can be unlocked nearby...";
			}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'Exterior'){
				return "Something could be around back...";
			}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'ExteriorFireEscape'){
				return "Something can unlocked below...";
			}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'ExteriorFireEscapeUpper'){
				return "Something can unlocked below...";
			}else{
				return "There are new places to find. Continue your investigation...";
			}
			
		}
		
		private function EnterGreenHouseHint():String{
			if(game.SavedGame.SavedGameObj.data.ThirdFloorHall != undefined){
				if(game.SavedGame.SavedGameObj.data.ThirdFloorHall['GasMaskAttached'] == 'Yes'){
					return VenusHint();
				}else{
					if(game.SavedGame.SavedGameObj.data.ThirdFloorHall['GreenHouseDoorOpen'] == 'Yes'){
						if(game.SavedGame.SavedGameObj.data.ExteriorCarRear != undefined){								
							if(game.SavedGame.SavedGameObj.data.ExteriorCarRear['GasMask'] == 'PickedUp'){	
								if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'ThirdFloorHall'){
									return "Why not try using the gas mask to enter the room on the left?";
								}else{
									return "Continue the investigation - it's possible to enter new areas.";
								}
							}else{
								return EnterGreenHouseBUNDLE01();
							}
						}else{
							return EnterGreenHouseBUNDLE01();
						}
					}else{
						return EnterGreenHouseBUNDLE00();
					}
					
				}
			}else{
				return EnterGreenHouseBUNDLE00();
			}
			
		}
		
		private function EnterGreenHouseBUNDLE01():String{
			if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'ExteriorCarRear'){
				return "Why not pick up the gas mask ?";
			}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'ExteriorRear'){
				return "There's an item nearby that can be picked up.";
			}else{
				return "There are items that can picked up....";
			}
		}
		
		private function EnterGreenHouseBUNDLE00():String{
			if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'ThirdFloorHall'){
				return "Try opening the doors on the left..";
			}else{
				return "Continue searching... There's more to find.";
			}
		}
		
		private function VenusHint():String{
			if(game.SavedGame.SavedGameObj.data.GreenHouseVenus != undefined){
				if(game.SavedGame.SavedGameObj.data.GreenHouseVenus['MetalAttached'] == 'Yes'){
					return KomaPuzzleHint();
				}else{
					return VenusBUNDLE01();
				}
			}else{
				return VenusBUNDLE01();
			}
			
		}
		
		private function VenusBUNDLE01():String{
			if(game.SavedGame.SavedGameObj.data.ExteriorFireEscapeUpper != undefined){	
				if(game.SavedGame.SavedGameObj.data.ExteriorFireEscapeUpper['Metal'] == 'PickedUp'){
					if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'GreenHouseVenus'){
						return "Try using an inventory item to force the plant's jaws to stay open.";
					}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'GreenHouse'){
						return "Take a closer look at the giant plant creature...";
					}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'GreenHouseTable'){
						return "Something can be done in this room.";
					}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'GreenHouseSpore'){
						return "Something can be done in this room.";
					}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'ThirdFloorHall'){
						return "Head into the room on the left, see what you can do.";
					}else{
						return "There's something that can be done on the third floor.";
					}
				}else{
					return VenusBUNDLE00();
				}
			}else{
				return VenusBUNDLE00();
			}
		}
		
		private function VenusBUNDLE00():String{
			if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'ExteriorFireEscapeUpper'){
				return "Why not pick up the piece of metal?";
			}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'ExteriorFireEscape'){
				return "Try climbing to the top of the fire-escape, see what you can find.";
			}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'ExteriorRear'){
				return "Try seeing what's on the fire-escape...";
			}else{
				return "There are more items to find - Keep looking!";
			}
			
		}
		
		private function KomaPuzzleHint():String{
			if(game.SavedGame.SavedGameObj.data.RoboticsRoomKomaPuzzle != undefined){
				if(game.SavedGame.SavedGameObj.data.RoboticsRoomKomaPuzzle['Solved'] == 'Yes'){
					return AdimmPowerSupplyHint();
				}else{
					return KomaPuzzleBUNDLE01();
				}
			}else{
				return KomaPuzzleBUNDLE00();
			}
			
		}
		
		private function KomaPuzzleBUNDLE01():String{
			
			if(game.SavedGame.SavedGameObj.data.RoboticsRoomKomaPuzzle['Dial'] == 'Attached'){
				if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'RoboticsRoomKoma'){
					return "It's possible to open the hood of this robot. Look at the dials on the hood.";
					
				}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'RoboticsRoomKomaPuzzle'){
					return "Try starting with the bottom right disc, then the upper left.";
				}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'RoboticsRoom'){
					return "Why not take a closer look at the orange robot?";
				}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'RoboticsDesk'){
					return "Something can be opened in this room.";
				}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'RoboticsBody'){
					return "Something can be opened elsewhere in this room.";
				}else{
					return "Something can be solved in the ground floor robotics workshop...";
				}
			}else{
				return KomaPuzzleBUNDLE00();
			}
			
		}
		private function KomaPuzzleBUNDLE00():String{
			if(game.SavedGame.SavedGameObj.data.GreenHouseVenus != undefined){
				if(game.SavedGame.SavedGameObj.data.GreenHouseVenus['Disc'] == 'PickedUp'){
					if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'RoboticsRoomKoma'){
						return "Try using the orange disc recovered from the large plant here.";
					}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'RoboticsRoomKomaPuzzle'){
						return "Take a closer look at the five discs on face of this robot.";
					}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'RoboticsRoom'){
						return "Take a closer look at the orange robot.";
					}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'RoboticsDesk'){
						return "Something can be done elsewhere in this room.";
					}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'RoboticsBody'){
						return "Something can be done elsewhere in this room.";
					}else{
						return "Something can be done in the robotics workshop...";
					}
				}else{
					if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'GreenHouseVenus'){
						return "There's something in the plant's jaws...";
					}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'GreenHouse'){
						return "There's something in the plant's jaws...";
					}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'GreenHouseTable'){
						return "There's an item that can be picked up in this room.";
					}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'GreenHouseSpore'){
						return "There's an item that can be picked up in this room.";
					}else{
						return "There are more items to find...";
					}
				}
			}else{
				return "No hint at this time.";
			}
		}
		
		
		private function AdimmPowerSupplyHint():String{
			if(game.SavedGame.SavedGameObj.data.RoboticsBody != undefined){	
				if(game.SavedGame.SavedGameObj.data.RoboticsBody['PowerSupply'] == 'Attached'){	
					return FanHints();
				}else{
					if(game.SavedGame.SavedGameObj.data.RoboticsRoomKoma != undefined){	
						if(game.SavedGame.SavedGameObj.data.RoboticsRoomKoma['PowerSupply'] == 'PickedUp'){	
							if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'RoboticsRoomKoma'){
								return "There's another place to use the power supply in this room...";
							}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'RoboticsRoom'){
								return "Take a closer look at the disassembled android on the workbench."
							}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'RoboticsDesk'){
								return "Take a closer look at the disassembled android on the workbench."
							}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'RoboticsBody'){
								return "The hole in the android's chest is similar to the power chamber in the large orange robot."
							}else{
								return "Head to the robotics workshop! There's something that can be done.";
							}
						}else{
							return AdimmPowerSupplyBUNDLE00();
						}
					}else{
						return AdimmPowerSupplyBUNDLE00();
					}
				}
			}else{
				return 'No hint at this time';
			}
			
		}
		
		
		private function AdimmPowerSupplyBUNDLE00():String{
			if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'RoboticsRoomKoma'){
				return "Take a closer look at this robot's interior.";
			}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'RoboticsRoom'){
				return "Take a another look at the large orange robot.";
			}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'RoboticsDesk'){
				return "There's something to find elsewhere in this room.";
			}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'RoboticsBody'){
				return "There's something to find elsewhere in this room.";
			}else{
				return "There's something to discover in the robotics workshop.";
			}
		}
		
		private function FanHints():String{
			if(game.SavedGame.SavedGameObj.data.BathroomDuctFan != undefined){	
				if(game.SavedGame.SavedGameObj.data.BathroomDuctFan['Stick'] == 'Attach'){	
					return HardDriveHints();
				}else{
					return FanHintBUNDLE00();
				}
			}else{
				return FanHintBUNDLE00();
			}
		}
		
		private function FanHintBUNDLE00():String{
			if(game.SavedGame.SavedGameObj.data.SecondFloorCart != undefined){
				if(game.SavedGame.SavedGameObj.data.SecondFloorCart['stick'] == 'PickedUp'){
					if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'BathroomDuctFan'){
						return "Try using an inventory item to jam the fan...";
					}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'BathroomDuct'){
						return "Try using an inventory item to stop the fan.";
					}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'Bathroom'){
						return "Something can be done inside the ventilation duct.";
					}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'ServerRoom'){
						return "Something can be done inside the ventilation duct.";
					}else{
						return "There's something to do on the second floor. Continue the investigation.";
					}
				}else{
					if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'SecondFloorCart'){
						return "Why not pick up the broken mop pole?";
					}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'SecondFloorHall'){
						return "There's an item on the floor that can be picked up.";
					}else{
						return "There are items to pick up. Look around."
					}
				}
			}else{
				return "No hint at this time.";
			}
		}
		
		private function HardDriveHints():String{
			if(game.SavedGame.SavedGameObj.data.BathroomDuctFan != undefined){	
				if(game.SavedGame.SavedGameObj.data.BathroomDuctFan['HardDrive'] == 'PickedUp'){	
					return MPPIDAdimmHint();
				}else{
					if(game.SavedGame.SavedGameObj.data.RoboticsDesk != undefined){	
						if(game.SavedGame.SavedGameObj.data.RoboticsDesk['Claw'] == 'PickedUp'){	
							if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'BathroomDuctFan'){
								return "Try using an inventory item to reach the hard-drive behind the fan.";
							}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'BathroomDuct'){
								return "Try using an inventory item to reach the hard-drive behind the fan.";
							}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'Bathroom'){
								return "Something can be done inside the ventilation duct.";
							}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'ServerRoom'){
								return "Something can be done inside the ventilation duct.";
							}else{
								return "There's something to do on the second floor. Continue the investigation.";
							}
						}else{
							return HardDriveHintsBUNDLE00();
						}
					}else{
						return HardDriveHintsBUNDLE00();
					}
				}
			}else{
				return "No hint at this time.";
			}
			
		}
		private function HardDriveHintsBUNDLE00():String{
			if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'RoboticsRoomKoma'){
				return "There's an item nearby that can be picked up.";
			}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'RoboticsRoom'){
				return "There's an item in this room that can be picked up.";
			}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'RoboticsDesk'){
				return "Why not pick up the brightly colored mechanical claw beside the workbench?";
			}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'RoboticsRoomBody'){
				return "There's something useful nearby.";
			}else{
				return "There's something useful on the ground floor.";
			}
		}
		
		
		
		private function MPPIDAdimmHint():String{
			if(game.SavedGame.SavedGameObj.data.RocketRoomComputerDesk != undefined){
				if(game.SavedGame.SavedGameObj.data.RocketRoomComputerDesk['Cube'] == 'Attached'){	
					return MPPIDHDDHint();
				}else if(game.SavedGame.SavedGameObj.data.RocketRoomComputerDesk['CubeWritten'] == 'Yes'){	
					return MPPIDHDDHint();
				}else{
					return MPPIDAdimmHintBUNDLE00();
				}
			}else{
				return MPPIDAdimmHintBUNDLE00();
			}
			
		}
		
		private function MPPIDAdimmHintBUNDLE00():String{
			if(game.SavedGame.SavedGameObj.data.ServerRoomComputer['Cube'] == 'PickedUp'){
				if(game.SavedGame.SavedGameObj.data.RoboticsBody != undefined){	
					if(game.SavedGame.SavedGameObj.data.RoboticsBody['Cube'] == 'Attached'){	
						if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'RoboticsBody'){
							return "More needs to be done with the multifaceted cube before using it with the android..";
						}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'RoboticsDesk'){
							return "Take another look at the android on the workbench.";
						}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'RoboticsRoom'){
							return "Take another look at the android in the corner of the room.";
						}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'RoboticsRoomKoma'){
							return "Take another look at the android in the corner of the room.";
						}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'RoboticsRoomKomaPuzzle'){
							return "Take another look at the android in the corner of the room.";
						}else{
							return "Return to the robotics workshop, there's something you'll need there.";
						}
					}else{
						return MPPIDAdimmBUNDLE01();
					}
				}else{
					return MPPIDAdimmBUNDLE01();
				}
				
				
			}else{
				if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'ServerRoom'){
					return "Why not remove the repaired cube from the computer tower?";
				}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'ServerRoomComputer'){
					return "Why not remove the repaired cube from the computer tower?";
				}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'ServerRoomTable'){
					return "Why not remove the repaired cube from the computer tower?";
				}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'ServerRoomPal'){
					return "Why not remove the repaired cube from this computer tower?";
				}else{
					return "There's an object that can be picked up in the server room";
				}
			}
		}
		
		private function MPPIDAdimmBUNDLE01():String{
			
			
			if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'RocketRoomComputerDesk'){
				return "Try to see if the intricate cube fits inside this machine.";
			}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'RocketRoomComputer'){
				return "See if you can add something to the machine hooked up to this computer.";
			}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'RocketRoom'){
				return "Take a look at the machine connected to the computer in this room.";
			}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'RocketRoomSat'){
				return "Something can be done elsewhere in this room.";
			}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'RocketRoomSatStation'){	
				return "Something can be done elsewhere in this room.";
			}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'RocketRoomDesk'){
				return "Something can be done elsewhere in this room.";
			}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'RocketRoomBoard'){
				return "Something can be done elsewhere in this room.";
			}else{
				return "Something can be done in the second floor rocketry room.";
			}
		}
		
		
		private function MPPIDHDDHint():String{
			if(game.SavedGame.SavedGameObj.data.RocketRoomComputerDesk != undefined){
				if(game.SavedGame.SavedGameObj.data.RocketRoomComputerDesk['HDD'] == 'Attached'){	
					return MPPIDWrite();
				}else{
					if(game.SavedGame.SavedGameObj.data.RocketRoomComputerDesk['HDD'] == 'Out'){	
						if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'RocketRoomComputerDesk'){
							return "Try inserting the hard drive...";
						}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'RocketRoomComputer'){
							return "Try inserting the hard drive into the nearby computer tower...";
						}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'RocketRoom'){
							return "Something needs to be done with the computer tower in this room.";
						}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'RocketRoomSat'){
							return "Something needs to be done with the computer tower in this room.";
						}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'RocketRoomSatStation'){	
							return "Something needs to be done with the computer tower in this room.";
						}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'RocketRoomDesk'){
							return "Something needs to be done with the computer tower in this room.";
						}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'RocketRoomBoard'){
							return "Something needs to be done with the computer tower in this room.";
						}else{
							return "Something needs to be done in the rocketry room.";
						}
					}else{
						if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'RocketRoomComputerDesk'){
							return "Try inserting the hard drive into this computer tower.";
						}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'RocketRoomComputer'){
							return "Try thinking of a way to get more data accessible to the programs on this computer.";
						}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'RocketRoom'){
							return "Something can be done with the computer tower in this room.";
						}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'RocketRoomSat'){
							return "Something can be done with the computer tower in this room.";
						}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'RocketRoomSatStation'){	
							return "Something can be done with the computer tower in this room.";
						}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'RocketRoomDesk'){
							return "Something can be done with the computer tower in this room.";
						}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'RocketRoomBoard'){
							return "Something can be done with the computer tower in this room.";
						}else{
							return "There's something to do in the rocketry room.";
						}
					}
				}
			}else{
				return "No hint at this time.";
			}
			
		}
		
		private function MPPIDWrite():String{
			if(game.SavedGame.SavedGameObj.data.RocketRoomComputer != undefined){
				if(game.SavedGame.SavedGameObj.data.RocketRoomComputer['WriteSuccess'] == 'Yes'){
					return AdimmPowerCableHint();
				}else{
					return MPPIDWriteBUNDLE();
				}
			}else{
				return MPPIDWriteBUNDLE();
			}
			
		}
		
		private function MPPIDWriteBUNDLE():String{
			if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'RocketRoomComputerDesk'){
				return "Something can be accomplished by using this computer.";
			}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'RocketRoomComputer'){
				return "Something can be accomplished by using a program on this computer.";
			}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'RocketRoom'){
				return "Something can be accomplished on the computer in this room.";
			}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'RocketRoomSat'){
				return "Something can be accomplished on the computer in this room.";
			}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'RocketRoomSatStation'){	
				return "Something can be accomplished on the computer in this room.";
			}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'RocketRoomDesk'){
				return "Something can be accomplished on the computer in this room.";
			}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'RocketRoomBoard'){
				return "Something can be accomplished on the computer in this room.";
			}else{
				return "Something can be accomplished in the rocketry room...";
			}
		}
		
		private function AdimmPowerCableHint():String{
			if(game.SavedGame.SavedGameObj.data.RoboticsBody != undefined){	
				if(game.SavedGame.SavedGameObj.data.RoboticsBody['Cord'] == 'Attached'){	
					return AdimmCubeHint();
				}else{
					if(game.SavedGame.SavedGameObj.data.RoboticsDesk != undefined){	
						return AdimmPowerCableHitBUNDLE00();
					}else{
						return AdimmPowerCableHitBUNDLE00();
					}
				}
			}else{
				return "No hint at this time.";
			}
			
		}
		
		private function AdimmPowerCableHitBUNDLE00():String{
			if(game.SavedGame.SavedGameObj.data.RoboticsDesk['Cord'] == 'PickedUp'){	
				if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'RoboticsRoomKoma'){
					return "There's something to do on the workshop desk.";
				}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'RoboticsRoom'){
					return "There's something to do on the workshop desk.";
				}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'RoboticsDesk'){
					return "See if there is anything that can be done with the disassembled android..";
				}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'RoboticsBody'){
					return "Try using an inventory item to connect the android's head to it's body...";
				}else{
					return "Something can be done in the ground floor robotics workshop.";
				}
			}else{
				if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'RoboticsRoomKoma'){
					return "There's an item nearby that can be picked up.";
				}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'RoboticsRoom'){
					return "There's an item nearby that can be picked up.";
				}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'RoboticsDesk'){
					return "There's an item here to pick up."
				}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'RoboticsBody'){
					return "Try to find a way to connect the android's head to it's body...";
				}else{
					return "There are items to find. Look around different areas of the ground floor.";
				}
			}
		}
		
		private function AdimmCubeHint():String{
			if(game.SavedGame.SavedGameObj.data.RoboticsBody != undefined){
				if(game.SavedGame.SavedGameObj.data.RoboticsBody['Cube'] == 'Attached'){
					return TurnOnAdimmHint();
				}else{
					if(game.SavedGame.SavedGameObj.data.RocketRoomComputerDesk != undefined){
						if(game.SavedGame.SavedGameObj.data.RocketRoomComputerDesk['Cube'] == 'PickedUp'){	
							if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'RoboticsBody'){
								return "Try placing the faceted cube inside the android's head case now...";
							}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'RoboticsRoomKoma'){
								return "There's something that can be done on the nearby workbench.";
							}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'RoboticsRoom'){
								return "There's something that can be done on the nearby workbench.";
							}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'RoboticsDesk'){
								return "Take a closer at the android's head.."
								
							}else{
								return "Something can be accomplished in the robotics workshop...";
							}
						}else{
							if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'RocketRoomComputerDesk'){
								return "Why not pick up the programmed cube from the machine on the desk?";
							}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'RocketRoomComputer'){	
								return "There's something in this room which could be useful.";
							}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'RocketRoom'){	
								return "Why not pick up the programmed cube from the machine on the desk?";
							}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'RocketRoomDesk'){	
								return "There's something in this room which could be useful.";
							}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'RocketRoomSat'){	
								return "There's something in this room which could be useful.";
							}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'RocketRoomSatStation'){	
								return "There's something in this room which could be useful.";
							}else{
								return "There's something in the second floor rocketry room that could be useful.";
							}
						}
					}else{
						return "No hint at this time."
					}
				}
			}else{
				return "No hint at this time.";
			}
			
		}
		
		private function TurnOnAdimmHint():String{
			if(game.SavedGame.SavedGameObj.data.RoboticsBody != undefined){	
				if(game.SavedGame.SavedGameObj.data.RoboticsBody['AdimmActive'] == 'Yes'){
					return AdimmEthernetHint();
				}else{
					if(game.SavedGame.SavedGameObj.data.RoboticsBody['ChestHole'] == 'Open'){
						if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'RoboticsBody'){
							return "Try closing the lid over the power-supply in the android's chest.";
						}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'RoboticsRoomKoma'){
							return "Try working some more with the android in the corner of this room.";
						}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'RoboticsRoom'){
							return "Try working some more with the android in the corner.";
						}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'RoboticsDesk'){							
							return "Try working some more with the android on the bench.";
						}else{
							return "Something needs to be done in the robotics workshop...";
						}
					}else{
						if(game.SavedGame.SavedGameObj.data.RoboticsBody['Lid'] == 'Open'){	
							if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'RoboticsBody'){
								return "Try closing the lid to the android's brain-case.";
							}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'RoboticsRoomKoma'){
								return "Try working some more with the android in the corner of this room.";
							}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'RoboticsRoom'){
								return "Try working some more with the android in the corner.";
							}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'RoboticsDesk'){							
								return "Try working some more with the android on the bench.";
							}else{
								return "Something needs to be done in the robotics workshop...";
							}
						}else{
							return "No hint at this time.";
						}
					}
				}
			}else{
				return "No hint at this time";
			}
			
		}
		
		
		private function AdimmEthernetHint():String{
			if(game.SavedGame.SavedGameObj.data.RoboticsBody != undefined){	
				if(game.SavedGame.SavedGameObj.data.RoboticsBody['Ethernet'] == 'Attached'){	
					return ListenToAdimmHint();
				}else{
					if(game.SavedGame.SavedGameObj.data.ThirdFloorHall != undefined){
						if(game.SavedGame.SavedGameObj.data.ThirdFloorHall['Ethernet'] == 'PickedUp'){
							if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'RoboticsBody'){
								return "Try using the purple ethernet cable to connect the android to the building's network.";
							}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'RoboticsRoomKoma'){
								return "There's something that can be done with the android on the nearby workbench.";
							}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'RoboticsRoom'){
								return "There's something that can be done with the android on the nearby workbench.";
							}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'RoboticsDesk'){
								return "There's something that can be done with the android on the nearby workbench.";
							}else{
								return "Something can be accomplished in the robotics workshop...";
							}
						}else{
							if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'ThirdFloorHall'){
								return "Why not pick up the purple cable laying on the floor.";
							}else{
								return "There's an item to pick up - search the building...";
							}
						}
					}else{
						return "No hint at this time";
					}
				}
			}else{
				return "No hint at this time.";
			}
			
		}
		
		private function ListenToAdimmHint():String{
			if(game.SavedGame.SavedGameObj.data.ThirdFloorHall != undefined){
				if(game.SavedGame.SavedGameObj.data.ThirdFloorHall['LabDoorOpen'] == 'Yes'){
					return BuildingOfficePushButtonHint();
				}else{
					
					if(game.SavedGame.SavedGameObj.data.RoboticsBody != undefined){			
						if(game.SavedGame.SavedGameObj.data.RoboticsBody['AdimmFried'] == 'Yes'){
							if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'ThirdFloorHall'){
								return "Try and see if the door is now unlocked.";
							}else{
								return "There's a door on the third floor that ADIMM tried to open. Go see if it's accessible.";
							}
							
						}else{
							if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'RoboticsBody'){
								return "Continue the conversation with ADIMM.";
							}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'RoboticsRoomKoma'){
								return "There's something that can be accomplished in the room.";
							}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'RoboticsRoom'){
								return "There's something that can be accomplished in the room.";
							}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'RoboticsDesk'){
								return "There's something that can be accomplished in the room.";
							}else{
								return "There's something that can be accomplished in the robotics room";
							}
						}
					}else{
						return "No hint at this time.";
					}
				}
			}else{
				return "No hint at this time.";
			}
			
		}
		
		private function BuildingOfficePushButtonHint():String{
			if(game.SavedGame.SavedGameObj.data.BuildingOfficePushBox != undefined){	
				if(game.SavedGame.SavedGameObj.data.BuildingOfficePushBox['PushBox'] == 'Attached'){	
					return BuildingOfficeBackDoorHint();
				}else{
					if(game.SavedGame.SavedGameObj.data.RocketRoomComputerDesk != undefined){
						return BuildingOfficePushBoxBUNDLE00();
					}else{
						return "No hint at this time.";
					}
				}
			}else{
				return BuildingOfficePushBoxBUNDLE00();
			}
			
		}
		
		private function BuildingOfficePushBoxBUNDLE00():String{
			if(game.SavedGame.SavedGameObj.data.RocketRoomComputerDesk['PushBox'] == 'PickedUp'){	
				if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'BuildingOfficePushBox'){
					return "Try using an inventory item here.";
				}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'BuildingOffice'){
					return "Take a look at the keypad on the wall next to the left hand door.";
				}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'BuildingOfficeCopier'){
					return "There's a place to use an inventory item in this room.";
				}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'BuildingOfficeDesk'){
					return "There's a place to use an inventory item in this room.";
				}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'BuildingOfficeComputer'){
					return "There's a place to use an inventory item in this room.";
				}else{
					return "Something can be done in the copy room on the first floor.";
				}
			}else{
				if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'RocketRoomComputerDesk'){
					return "There's an item in this desk that can be picked up.";
				}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'RocketRoomComputer'){	
					return "There's an item nearby that can be picked up.";
				}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'RocketRoom'){	
					return "There's an item in this room that can be picked up;";
				}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'RocketRoomDesk'){	
					return "There's an item in this desk that can be picked up.";
				}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'RocketRoomSat'){	
					return "There's an item in this desk that can be picked up.";
				}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'RocketRoomSatStation'){	
					return "There's an item in this desk that can be picked up.";
				}else{
					return "There's an item in the rocketry room that can be picked up.";
				}
			}
		}
		
		private function BuildingOfficeBackDoorHint():String{
			if(game.SavedGame.SavedGameObj.data.BuildingOfficePushBox != undefined){
				if(game.SavedGame.SavedGameObj.data.BuildingOfficePushBox['Solved'] == 'Yes'){
					return SafeHints();
				}else{
					return BuildingOfficeBackDoorHintBUNDLE00();
				}
			}else{
				return BuildingOfficeBackDoorHintBUNDLE00();
			}
			
			
		}
		
		private function BuildingOfficeBackDoorHintBUNDLE00():String{
			if(game.SavedGame.SavedGameObj.data.ExteriorCarFront != undefined){	
				if(game.SavedGame.SavedGameObj.data.ExteriorCarFront["Phone"] != undefined){
					
					if(game.SavedGame.SavedGameObj.data.Elevator != undefined){
						if(game.SavedGame.SavedGameObj.data.Elevator["Emergency"] != undefined){
							
							if(game.SavedGame.SavedGameObj.data.LobbyDesk != undefined){
								if(game.SavedGame.SavedGameObj.data.LobbyDesk["Phone"] != undefined){
									
									if(game.SavedGame.SavedGameObj.data.BuildingOfficeDesk != undefined){
										if(game.SavedGame.SavedGameObj.data.BuildingOfficeDesk["Book"] != undefined){
											if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'BuildingOfficePushBox'){
												return "This puzzle can be solved. There is a clue on the nearby desk.";
											}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'BuildingOffice'){
												return "It's possible to open the door in this room. There is a clue on the desk.";
											}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'BuildingOfficeCopier'){
												return "It's possible to open the door in this room. There is a clue on the desk.";
											}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'BuildingOfficeDesk'){
												return "Compare the information in the booklet here with the tones coming from several sources around the building.";
											}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'BuildingOfficeComputer'){
												return "It's possible to open the door in this room. There is a clue on the desk.";
											}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'ExteriorCarFront'){
												return "Try comparing the tones coming through the radio here to the booklet in the copy room.";
											}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'LobbyDesk'){
												return "Try comparing the tones coming through the phone here to the booklet in the copy room.";
											}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'Elevator'){
												return "Try comparing the tones coming through the speaker here to the booklet in the copy room.";
											}else{
												return "A door in the ground floor copy room can be unlocked... study the clues.";
											}
										}else{
											if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'BuildingOfficePushBox'){
												return "There's a clue nearby that can help with this puzzle.";
											}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'BuildingOffice'){
												return "There's a clue on the desk in this room.";
											}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'BuildingOfficeCopier'){
												return "There's a clue in this room that can help.";
											}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'BuildingOfficeDesk'){
												return "Why not take a look at the booklet on the desk here?";
											}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'BuildingOfficeComputer'){
												return "There's a clue in this room that can help.";
											}else{
												return "There's a clue to be found on the first floor.";
											}
										}
									}else{
										return "No hint at this time."
									}
									
								}else{
									if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'LobbyDesk'){
										return "Try picking up the phone.";
									}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'LobbyCounter'){
										return "Take a closer look at the desk here.";
									}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'LobbyComputer'){
										return "There's a clue nearby.";
									}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'Lobby'){
										return "Take a closer look at the security desk.";
									}else{
										return "There's a clue in the lobby that can help.";
									}
								}
							}else{
								return "No hint at this time."
							}
							
							
						}else{
							if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'Elevator'){
								return "There's a clue here...";
							}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'ElevatorPanel'){
								return "There's a clue here in the elevator...";
							}else{
								return "Take a look in the elevator, there's a clue there that can help.";
							}
							
						}
					}else{
						return "No hint at this time";
					}
					
					
				}else{
					if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'ExteriorCarFront'){	
						return "Why not turn on the radio?";
					}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'ExteriorCarRear'){	
						return "Take a look in the front cabin of the van, there's a clue to find there.";
					}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'ExteriorRear'){	
						return "Take a look in the van, there's a clue to find.";
					}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'ExteriorGrate'){	
						return "Take a look in the van, there's a clue to find.";
					}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'ExteriorRearDumpster'){	
						return "Take a look in the van, there's a clue to find.";
					}else{
						return "There's a clue outside, behind the building..";
					}
				}
			}else{
				return "No hint at this time.";
			}
			
		}
		
		
		private function SafeHints():String{
			if(game.SavedGame.SavedGameObj.data.BuildingOfficeLock != undefined){	
				if(game.SavedGame.SavedGameObj.data.BuildingOfficeLock['Solved'] == 'Yes'){	
					//	return "SMURF FIRE 00";
					return GreenHouseRedTubeHint();
				}else{
					//	return "SMURF FIRE 01";
					return SafeHintBUNDLE03();
				}
			}else{
				//	return "SMURF FIRE 02";
				return SafeHintBUNDLE03();
			}
			
		}
		
		private function SafeHintBUNDLE03():String{
			
			if(game.SavedGame.SavedGameObj.data.BuildingOfficePainting != undefined){
				if(game.SavedGame.SavedGameObj.data.BuildingOfficePainting['Painting'] != undefined){
					
					if(game.SavedGame.SavedGameObj.data.RocketRoomBoard != undefined){
						if(game.SavedGame.SavedGameObj.data.RocketRoomBoard['SeenIn'] == 'Yes'){
							
							if(game.SavedGame.SavedGameObj.data.BuildingOfficeCopier != undefined){
								if(game.SavedGame.SavedGameObj.data.BuildingOfficeCopier["Book"] != undefined){
									
									if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'BuildingOfficePainting'){
										return "It's possible to open the safe here.";
									}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'BuildingOfficeLock'){
										return "There are clues in the copy machine in the next room and the in second floor rocketry room that can help with this lock";
									}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'BuildingOfficeBack'){
										return "It's possible to open the safe hidden behind the painting in this room.";
									}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'BuildingOfficeTable'){
										return "It's possible to open the safe hidden behind the painting in this room.";
									}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'BuildingOfficeTablePaper'){
										return "It's possible to open the safe hidden behind the painting in this room.";
									}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'BuildingOfficeBookCase'){
										return "It's possible to open the safe hidden behind the painting in this room.";
									}else{
										return "There's something that can be unlocked on the ground floor.";
									}
									
								}else{								
									return SafeHintsBUNDLE00();
								}
							}else{
								return SafeHintsBUNDLE00();
							}
							
						}else{
							return SafeHintsBUNDLE01();
						}
					}else{
						return SafeHintsBUNDLE01();
					}
				}else{
					return SafeHintBUNDLE02();
				}
			}else{
				return SafeHintBUNDLE02();
			}
		}
		
		private function SafeHintBUNDLE02():String{
			if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'BuildingOfficePainting'){
				return "Take a close look at the painting on the wall.";
			}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'BuildingOfficeBack'){
				return "Take a close look at the painting on the wall.";
			}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'BuildingOfficeTable'){
				return "Something can be discovered elsewhere in this room.";
			}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'BuildingOfficeTablePaper'){
				return "Something can be discovered elsewhere in this room.";
			}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'BuildingOfficeBookCase'){
				return "Something can be discovered elsewhere in this room.";
			}else{
				return "There's something to do in the reading room on the ground floor.";
			}
		}
		
		private function SafeHintsBUNDLE01():String{
			if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'RocketRoomComputerDesk'){
				return "There's a clue to look at in this room.";
			}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'RocketRoomComputer'){	
				return "There's a clue to look at in this room.";
			}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'RocketRoom'){	
				return "There's a clue to look at in this room.";
			}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'RocketRoomDesk'){	
				return "There's a clue to look at in this room.";
			}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'RocketRoomSat'){	
				return "There's a clue to look at in this room.";
			}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'RocketRoomSatStation'){	
				return "Take a closer look at the white board...";
			}else{
				return "There's a clue to find in the second floor rocketry research room...";
			}
		}
		
		private function SafeHintsBUNDLE00():String{
			if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'BuildingOffice'){
				return "There's a clue on the bed of the copy machine.";
			}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'BuildingOfficeCopier'){
				return "There's a clue in this room that can help.";
			}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'BuildingOfficeDesk'){
				return "There's a clue in this room that can help."
			}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'BuildingOfficeComputer'){
				return "There's a clue in this room that can help.";
			}else{
				return "There's a clue to be found in the first floor copy room.";
			}
		}
		
		private function GreenHouseRedTubeHint():String{
			if(game.SavedGame.SavedGameObj.data.GreenHouseTable != undefined){	
				if(game.SavedGame.SavedGameObj.data.GreenHouseTable['RedTube'] == 'Attached'){
					return EmptyTubeCoffeeMachineHint();
				}else{
					return GreenHouseRedTubeHintBUNDLE00();
				}
			}else{
				return GreenHouseRedTubeHintBUNDLE00();
			}
			
		}
		
		private function GreenHouseRedTubeHintBUNDLE00():String{
			if(game.SavedGame.SavedGameObj.data.BuildingOfficePainting != undefined){
				if(game.SavedGame.SavedGameObj.data.BuildingOfficePainting['Tube'] == 'PickedUp'){
					if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'GreenHouseTable'){
						//	return "FUBAR";
						return "An inventory item can be attached to this machine.";
					}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'GreenHouseMicroscope'){
						return "An inventory item can be attached to the machine this microscope is a part of.";								
					}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'GreenHouse'){
						return "Something can be done with the machine on the table.";
					}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'GreenHouseVenus'){
						return "Something can be done with the machine on the table in the center of the room.";
					}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'GreenHouseSpore'){
						return "Something can be done with the machine on the table in the center of the room.";
					}else{
						return "Something can be done in the botany laboratory on the third floor.";
					}
				}else{
					if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'BuildingOfficePainting'){
						return "Why not pick up the tube containing the pink-red fluid from the wall safe?";
					}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'BuildingOfficeBack'){
						return "There's an item to pick up in the wall safe.";
					}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'BuildingOfficeTable'){
						return "There's an item to pick up in the wall safe.";
					}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'BuildingOfficeTablePaper'){
						return "There's an item to pick up in the wall safe.";
					}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'BuildingOfficeBookCase'){
						return "There's an item to pick up in the wall safe.";
					}else{
						return "There's an item in the ground floor reading room that can be picked up.";
					}
				}
			}else{
				return "No hint at this time.";
			}
		}
		
		private function EmptyTubeCoffeeMachineHint():String{
			if(game.SavedGame.SavedGameObj.data.LabHexPuzzle != undefined){
				if(game.SavedGame.SavedGameObj.data.LabHexPuzzle['Solved'] == 'Yes'){
					return PlaceBlueTubeHint();
				}else{
					return EmptyTubeCoffeeMachineBUNDLE02();
				}
			}else{
				return EmptyTubeCoffeeMachineBUNDLE02();
			}
			
		}
		
		private function EmptyTubeCoffeeMachineBUNDLE02():String{
			if(game.SavedGame.SavedGameObj.data.LabDesk != undefined){	
				if(game.SavedGame.SavedGameObj.data.LabDesk['TubeAttached'] == "Yes"){	
					if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'LabDesk'){
						return "Take a closer look at the laptop on the table.";
					}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'LabHexPuzzle'){
						return "Try arranging the nodes so lines connect through all touching edges.";
					}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'Lab'){
						return "Take a closer look at the laptop on the table.";
					}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'LabAsteriod'){
						return "Something can be solved elsewhere in this room.";
					}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'LabAsteriodPuzzle'){
						return "Something can be solved elsewhere in this room.";
					}else{
						return "Something can be solved in the central laboratory.";
					}
				}else{
					return EmptyTubeCoffeeMachineBUNDLE01();
				}
			}else{
				return EmptyTubeCoffeeMachineBUNDLE01();
			}
		}
		
		private function EmptyTubeCoffeeMachineBUNDLE01():String{
			if(game.SavedGame.SavedGameObj.data.OfficeKitchenSink != undefined){	
				if(game.SavedGame.SavedGameObj.data.OfficeKitchenSink['Tongs'] == 'PickedUp'){	
					
					if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'LabDesk'){
						return "Try attaching an inventory item to the machine here.";
					}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'LabHexPuzzle'){
						return "Something needs to be inserted into the nearby machine before this puzzle can solved...";
					}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'Lab'){
						return "Take a closer look at the machine on the table.";
					}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'LabAsteriod'){
						return "Something can be done elsewhere in this room.";
					}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'LabAsteriodPuzzle'){
						return "Something can be done elsewhere in this room.";
					}else{
						return "Something can be done in the central laboratory.";
					}
				}else{
					return EmptyTubeCoffeeMachineBUNDLE00();
				}
			}else{
				return EmptyTubeCoffeeMachineBUNDLE00();
			}
		}
		
		private function EmptyTubeCoffeeMachineBUNDLE00():String{
			if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'OfficeKitchenSink'){
				return "Why not pick up the glass tube in the sink?";
			}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'OfficeKitchen'){
				return "Take a look in the sink.";						
			}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'Office'){
				return "There's an item to pick up in this room.";
			}else{
				return "There are items to find. Keep looking.";
			}
		}
		
		private function PlaceBlueTubeHint():String{
			if(game.SavedGame.SavedGameObj.data.GreenHouseTable != undefined){	
				if(game.SavedGame.SavedGameObj.data.GreenHouseTable['BlueTube'] == 'Attached'){
					return SyringePlace();
				}else{
					if(game.SavedGame.SavedGameObj.data.LabDesk != undefined){	
						if(game.SavedGame.SavedGameObj.data.LabDesk['TubePickedUp'] == "Yes"){	
							if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'GreenHouseTable'){
								return "An inventory item can be attached to this machine.";
							}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'GreenHouseMicroscope'){
								return "An inventory item can be attached to the machine this microscope is a part of.";								
							}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'GreenHouse'){
								return "Something can be done with the machine on the table.";
							}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'GreenHouseVenus'){
								return "Something can be done with the machine on the table in the center of the room.";
							}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'GreenHouseSpore'){
								return "Something can be done with the machine on the table in the center of the room.";
							}else{
								return "Something can be done in the botany laboratory on the third floor.";
							}
						}else{
							if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'LabDesk'){
								return "Why not pick up the glass tube now filled with a blue fluid?";
							}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'Lab'){
								return "There is an item to pick up in this room.";
							}else{
								return "There are more items to find.";
							}
						}
						
					}else{
						return "No hint at this time.";						
					}
				}
				
			}else{
				return "No hint at this time.";
			}
			
			
		}
		private function SyringePlace():String{
			if(game.SavedGame.SavedGameObj.data.GreenHouseTable != undefined){	
				if(game.SavedGame.SavedGameObj.data.GreenHouseTable['Syringe'] == 'Attached'){
					return SlideHint();
				}else if(game.SavedGame.SavedGameObj.data.GreenHouseTable['Syringe'] == 'PickedUp'){	
					return SlideHint();
				}else{					
					return SyringePlaceBUNDLE00();
				}
			}else{
				return "No hint at this time.";				
			}
		}
		
		private function SyringePlaceBUNDLE00():String{
			if(game.SavedGame.SavedGameObj.data.LabDesk != undefined){	
				if(game.SavedGame.SavedGameObj.data.LabDesk['Syringe'] == "PickedUp"){
					if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'GreenHouseTable'){
						return "Try attaching the syringe to the machine.";
					}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'GreenHouseMicroscope'){
						return "Try attaching the syringe to the machine.";
					}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'GreenHouse'){
						return "Take another look at the machine on the table.";
					}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'GreenHouseVenus'){
						return "Take another look at the machine on the table in the center of the room.";
					}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'GreenHouseSpore'){
						return "Take another look at the machine on the table in the center of the room.";
					}else{
						return "Something can be done in the third floor botany laboratory...";
					}
				}else{
					if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'LabDesk'){
						return "Why not pick up the syringe on the table?";
					}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'Lab'){
						return "There's an item to on table to pick up.";
					}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'LabAsteriod'){
						return "There's an item in this room to pick up.";
					}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'LabAsteriodPuzzle'){
						return "There's an item in this room to pick up.";
					}else{
						return "There's something useful in the third floor central laboratory.";
					}
				}
			}else{
				return "No hint at this time.";
			}
		}
		private function SlideHint():String{
			if(game.SavedGame.SavedGameObj.data.GreenHouseTable != undefined){	
				if(game.SavedGame.SavedGameObj.data.GreenHouseTable['Slide'] == 'Attached'){
					return SolveMicroscopeHint();
				}else{
					if(game.SavedGame.SavedGameObj.data.BuildingOfficeTable != undefined){	
						if(game.SavedGame.SavedGameObj.data.BuildingOfficeTable['Stone'] == 'PickedUp'){	
							if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'GreenHouseTable'){
								return "Try placing the slide from your inventory under the lens of the microscope.";
							}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'GreenHouse'){
								return "It's possible to do something with the microscope on the table.";
							}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'GreenHouseVenus'){
								return "It's possible to do something with the microscope in this room.";
							}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'GreenHouseSpore'){
								return "It's possible to do something with the microscope in this room.";
							}else{
								return "There's a dicovery to be made in the botany lab on the third floor.";
							}
						}else{
							return SlideHintBUNDLE00();
						}
					}else{
						return SlideHintBUNDLE00();
					}
				}
			}else{
				return "No hint at this time";
			}
			
			
		}
		
		private function SlideHintBUNDLE00():String{
			if(game.SavedGame.SavedGameObj.data.BuildingOfficeTable != undefined){	
				if(game.SavedGame.SavedGameObj.data.BuildingOfficeTable['Case'] != undefined){	
					return	SlideHintBUNDLE01();
				}else{
					if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'BuildingOfficePainting'){
						return "There's something to discover nearby.";
					}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'BuildingOfficeBack'){
						return "Take a look at the case on the desk.";
					}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'BuildingOfficeTable'){
						return "Why not look inside the metal briefcase?";
					}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'BuildingOfficeTablePaper'){
						return "There's something to discover nearby.";
					}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'BuildingOfficeBookCase'){
						return "There's something to discover nearby.";
					}else{
						return "There's an item to find in the ground floor reading room.";
					}
				}
			}else{
				return	SlideHintBUNDLE01();
			}
		}
		
		private function SlideHintBUNDLE01():String{
			if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'BuildingOfficePainting'){
				return "There's an item in this room.";
			}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'BuildingOfficeBack'){
				return "There's an item to pick up in this room.";
			}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'BuildingOfficeTable'){
				return "Why not pick up the object inside the metal briefcase?";
			}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'BuildingOfficeTablePaper'){
				return "An item can be picked up in this room."
			}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'BuildingOfficeBookCase'){
				return "An item can be picked up in this room."
			}else{
				return "There are more items to find. Keep looking.";
			}
		}
		
		private function SolveMicroscopeHint():String{
			if(game.SavedGame.SavedGameObj.data.GreenHouseMicroscope != undefined){
				if(game.SavedGame.SavedGameObj.data.GreenHouseMicroscope['Solved'] == 'Yes'){
					return SporeMeshSyringeHint();
				}else{
					return SolveMicroscopeHintBUNDLE00();
				}
			}else{
				return SolveMicroscopeHintBUNDLE00();
			}
			
		}
		
		private function SolveMicroscopeHintBUNDLE00():String{
			if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'GreenHouseMicroscope'){
				return "Try to find a way to move all microscopic entities to the other side of the cell wall.";
			}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'GreenHouseTable'){
				return "It's possible to solve the microscope here. Take a closer look.";
			}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'GreenHouse'){
				return "It's possible to solve the microscope on the table. Take a closer look.";
			}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'GreenHouseVenus'){
				return "It's possible to do something with the microscope on the table in the center of the room.";
			}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'GreenHouseSpore'){
				return "It's possible to do something with the microscope on the table in the center of the room.";
			}else{
				return "Something can be done in the botany laboratory.";
			}
		}
		
		private function SporeMeshSyringeHint():String{
			if(game.SavedGame.SavedGameObj.data.GreenHouseSpore != undefined){	
				if(game.SavedGame.SavedGameObj.data.GreenHouseSpore['Syringe'] == 'Attached'){	
					return SporeMeshSolutionHint();
				}else{
					return SporeMeshSyringeHintBUNDLE00();
				}
			}else{
				return SporeMeshSyringeHintBUNDLE00();
			}
			
		}
		
		private function SporeMeshSyringeHintBUNDLE00():String{
			if(game.SavedGame.SavedGameObj.data.GreenHouseTable != undefined){	
				if(game.SavedGame.SavedGameObj.data.GreenHouseTable['Syringe'] == 'PickedUp'){
					if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'GreenHouseTable'){
						return "Something can be done elsewhere in this room.";
					}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'GreenHouse'){
						return "Take a look at the growth covering the door to the right."
					}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'GreenHouseVenus'){
						return "Something can be done elsewhere in this room.";
					}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'GreenHouseSpore'){
						return "Try injecting the growth with the fluid inside the glowing syringe.";
					}else{
						return "Something can be done in the third floor botany laboratory.";
					}	
				}else{
					if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'GreenHouseTable'){
						return "Why not pick up the glowing syringe from the machine?";
					}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'GreenHouse'){
						return "There's an item on the table that can be picked up..."
					}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'GreenHouseVenus'){
						return "There's an item that can be picked up in this room.";
					}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'GreenHouseSpore'){
						return "There's an item that can be picked up in this room.";
					}else{
						return "There's an item in the third floor botany laboratory.";
					}	
				}
			}else{
				return "No hint at this time.";
			}
		}
		
		
		private function SporeMeshSolutionHint():String{
			if(game.SavedGame.SavedGameObj.data.GreenHouseSpore != undefined){	
				if(game.SavedGame.SavedGameObj.data.GreenHouseSpore['Solved'] == 'Yes'){
					return AcidCoffeePotHint();
				}else{
					if(game.SavedGame.SavedGameObj.data.GreenHouseTable != undefined){
						if(game.SavedGame.SavedGameObj.data.GreenHouseTable["Book"] != undefined){
							if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'GreenHouseTable'){
								return "The information in the print-outs on the table can help with the growth covering the door...";
							}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'GreenHouse'){
								return "It's possible to do something with the growth covering the door.";
							}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'GreenHouseVenus'){
								return "It's possible to do something with the growth covering the door in this room.";
							}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'GreenHouseSpore'){
								return "Try comparing the pattern of this growth with the information in the print-outs on the nearby table.";
							}else{
								return "There's something that can be solved in the botany laboratory.";
							}	
						}else{
							if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'GreenHouseTable'){
								return "There's some information here that could be of assistance.";
							}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'GreenHouse'){
								return "There's a clue in this room.";
							}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'GreenHouseVenus'){
								return "There's a clue in this room.";
							}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'GreenHouseSpore'){
								return "There's a clue elsewhere in this room that could help.";
							}else{
								return "There's a clue in the botany laboratory.";
							}	
						}
					}else{
						return "No hint at this time.";
					}
				}
			}else{
				return "No hint at this time";
			}
			
		}
		
		
		private function AcidCoffeePotHint():String{
			if(game.SavedGame.SavedGameObj.data.LabDoor != undefined){	
				if(game.SavedGame.SavedGameObj.data.LabDoor['Melted'] == 'Yes'){	
					return HeinleinBookHint();
				}else{
					return AcidCoffeePotHintBUNDLE02();
				}
			}else{
				return AcidCoffeePotHintBUNDLE02();
				
			}
			
			
		}
		private function AcidCoffeePotHintBUNDLE02():String{
			if(game.SavedGame.SavedGameObj.data.ExteriorRearDumpster != undefined){	
				if(game.SavedGame.SavedGameObj.data.ExteriorRearDumpster['Acid'] == 'PickedUp'){	
					if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'LabDoor'){
						return "See if the corrosive waste material can be of any assistance here...";
					}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'Lab'){
						return "Take a closer look at the sealed door on the far side of the room.";
					}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'LabDesk'){
						return "Something can be done elsewhere in this room.";
					}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'LabAsteriod'){
						return "Something can be done elsewhere in this room.";
					}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'LabAsteriodPuzzle'){
						return "Something can be done elsewhere in this room.";
					}else{
						return "Something can be unlocked in the central laboratory on the third floor.";
					}
				}else{
					return AcidCoffeePotHintBUNDLE01();
					
				}
			}else{
				return AcidCoffeePotHintBUNDLE01();
			}
		}
		
		private function AcidCoffeePotHintBUNDLE01():String{
			if(game.SavedGame.SavedGameObj.data.GeneticsRoomDesk != undefined){	
				if(game.SavedGame.SavedGameObj.data.GeneticsRoomDesk['Tube'] == 'PickedUp'){
					if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'ExteriorRearDumpster'){
						return "Try picking up some of the biological/chemical waste using the coffee pot.";
					}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'ExteriorRear'){
						return "Take another look at the waste receptacle.";
					}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'ExteriorGrate'){
						return "Take another look at the nearby waste receptacles.";
					}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'ExteriorCarFront'){
						return "Something can be done nearby, outside the van.";
					}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'ExteriorCarRear'){
						return "Something can be done nearby, outside the van.";
					}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'ExteriorFireEscape'){
						return "Something can be done below.";
					}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'ExteriorFireEscapeUpper'){	
						return "Something can be done below.";
					}else{
						return "Something can be done behind the building."
					}
				}else{
					return AcidCoffeePotHintBUNDLE00();
				}
			}else{
				return AcidCoffeePotHintBUNDLE00();
			}
		}
		
		private function AcidCoffeePotHintBUNDLE00():String{
			if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'GeneticsRoomElectron'){
				return "There's an item elsewhere in this room that can be picked up.";
			}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'GeneticsRoom'){
				return "There's an item in this room that can be picked up.";
			}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'GeneticsRoomMicroscope'){
				return "There's an item elsewhere in this room that can be picked up.";
			}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'GeneticsRoomLensPuzzle'){
				return "There's an item elsewhere in this room that can be picked up.";
			}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'GeneticsRoomBox'){
				return "There's an item elsewhere in this room that can be picked up.";
			}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'GeneticsRoomDesk'){
				return "Why not pick up the coffee pot?";
			}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'SpinWheel'){
				return "A nearby item can be picked up.";
			}else{
				return "An item can be picked up - continue the search.";
			}
		}
		
		private function HeinleinBookHint():String{
			if(game.SavedGame.SavedGameObj.data.BuildingOfficeBookCase != undefined){	
				if(game.SavedGame.SavedGameObj.data.BuildingOfficeBookCase['HeinleinAttached'] == "Yes"){	
					return BookSaganHint();
				}else{
					return HeinleinBookHintBUNDLE01();
				}
			}else{
				return HeinleinBookHintBUNDLE01();
				
			}
			
		}
		
		private function HeinleinBookHintBUNDLE01():String{
			if(game.SavedGame.SavedGameObj.data.DeepLabFridge != undefined){	
				if(game.SavedGame.SavedGameObj.data.DeepLabFridge['Book'] == 'PickedUp'){	
					if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'BuildingOfficePainting'){
						return "There's something to do in this room.";
					}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'BuildingOfficeBack'){
						return "Take a closer look at the bookcase.";
					}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'BuildingOfficeTable'){
						return "There's something to do in this room.";
					}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'BuildingOfficeTablePaper'){
						return "There's something to do in this room.";
					}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'BuildingOfficeBookCase'){
						return "The book on the shelf is similar to one in your inventory.";
					}else{
						return "Look around for a place to put 'The Puppet Masters'.";
					}
				}else{
					return HeinleinBookHintBUNDLE00();
				}
			}else{
				return HeinleinBookHintBUNDLE00();
			}
		}
		
		private function HeinleinBookHintBUNDLE00():String{
			if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'DeepLabFridge'){
				return "There's a book on the nearby shelf.";
			}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'DeepLab'){
				return "Take look at the shelf on the left side of this room.";
			}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'DeepLabDesk'){
				return "An item can be picked up in this room.";
			}else{
				return "There's something to pick up deep inside the third floor laboratory.";
			}
		}
		
		private function BookSaganHint():String{
			if(game.SavedGame.SavedGameObj.data.BuildingOfficeBookCase != undefined){	
				if(game.SavedGame.SavedGameObj.data.BuildingOfficeBookCase['SaganAttached'] == "Yes"){	
					return BookAsimovHint();
				}else{
					if(game.SavedGame.SavedGameObj.data.BuildingOfficeTable != undefined){	
						if(game.SavedGame.SavedGameObj.data.BuildingOfficeTable['Book'] == 'PickedUp'){	
							if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'BuildingOfficePainting'){
								return "There's something to do in this room.";
							}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'BuildingOfficeBack'){
								return "Take a closer look at the bookcase.";
							}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'BuildingOfficeTable'){
								return "There's something to do in this room.";
							}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'BuildingOfficeTablePaper'){
								return "There's something to do in this room.";
							}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'BuildingOfficeBookCase'){
								return "The book on the shelf is similar to one in your inventory.";
							}else{
								return "Look around for a place to put 'Contact' by Carl Sagan.";
							}
						}else{
							if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'BuildingOfficePainting'){
								return "There's an item to pick up in this room.";
							}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'BuildingOfficeBack'){
								return "Take a closer look at the desk.";
							}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'BuildingOfficeTable'){
								return "Why not pick up the book sitting on the chair?";
							}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'BuildingOfficeTablePaper'){
								return "There's an item to pick up in this room.";
							}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'BuildingOfficeBookCase'){
								return "There's another book to pick up nearby.";
							}else{
								return "Continue the investigation - there are more items to find.";
							}
						}
					}else{
						return "No hint at this time";
					}
				}
			}else{
				return "No hint at this time.";
			}
			
		}
		
		
		private function BookAsimovHint():String{
			if(game.SavedGame.SavedGameObj.data.BuildingOfficeBookCase != undefined){	
				if(game.SavedGame.SavedGameObj.data.BuildingOfficeBookCase['AsimovAttached'] == "Yes"){	
					return BookClarkHint();
				}else{
					if(game.SavedGame.SavedGameObj.data.GreenHouseDeepShelf != undefined){	
						if(game.SavedGame.SavedGameObj.data.GreenHouseDeepShelf['Book'] == 'PickedUp'){	
							if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'BuildingOfficePainting'){
								return "There's something to do in this room.";
							}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'BuildingOfficeBack'){
								return "Take a closer look at the bookcase.";
							}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'BuildingOfficeTable'){
								return "There's something to do in this room.";
							}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'BuildingOfficeTablePaper'){
								return "There's something to do in this room.";
							}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'BuildingOfficeBookCase'){
								return "The book on the shelf is similar to one in your inventory.";
							}else{
								return "Look around for a place to put 'The Gods Themselves' by Issac Asimov.";
							}
						}else{
							return BookAsimovHintBUNDLE00();	
						}
					}else{
						return BookAsimovHintBUNDLE00();	
					}
				}
			}else{
				return "No hint at this time.";
			}
			
		}
		
		private function BookAsimovHintBUNDLE00():String{
			if(game.SavedGame.SavedGameObj.data.GreenHouseDeepShelf != undefined){	
				if(game.SavedGame.SavedGameObj.data.GreenHouseDeepShelf['Right'] != undefined){
					if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'GreenHouseDeepShelf'){
						return "Why not pick up the book from the cabinet?";
					}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'GreenHouseDeep'){
						return "Take a look at the cabinet on the right.";
					}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'GreenHouseDeepBulb'){
						return "There's an item in this room.";
					}else{
						return "There are more items to find - continue the search.";
					}
				}else{
					return BookAsimoveHintBUNDLE01();
				}
			}else{
				return BookAsimoveHintBUNDLE01();
			}
			
		}
		
		private function BookAsimoveHintBUNDLE01():String{
			if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'GreenHouseDeepShelf'){
				return "Why not take a look inside the overhead cabinet?";
			}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'GreenHouseDeep'){
				return "Take a look at the cabinet on the right.";
			}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'GreenHouseDeepBulb'){
				return "There's an item to find in this room.";
			}else{
				return "There are more items to find - continue the search.";
			}
		}
		
		private function BookClarkHint():String{
			if(game.SavedGame.SavedGameObj.data.BuildingOfficeBookCase != undefined){	
				if(game.SavedGame.SavedGameObj.data.BuildingOfficeBookCase['ClarkeAttached'] == "Yes"){	
					return SolveBookShelf();
				}else{
					if(game.SavedGame.SavedGameObj.data.ExteriorCarFront != undefined){
						if(game.SavedGame.SavedGameObj.data.ExteriorCarFront['Book'] == 'PickedUp'){	
							if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'BuildingOfficePainting'){
								return "There's something to do in this room.";
							}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'BuildingOfficeBack'){
								return "Take a closer look at the bookcase.";
							}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'BuildingOfficeTable'){
								return "There's something to do in this room.";
							}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'BuildingOfficeTablePaper'){
								return "There's something to do in this room.";
							}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'BuildingOfficeBookCase'){
								return "Try placing a book from your inventory on the shelf.";
							}else{
								return "Look around for a place to put \"Childhood's End\" by Arthur C. Clarke.";
							}
						}else{
							if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'ExteriorCarFront'){
								return "Why not pick up the book between the seats?";
							}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'ExteriorCarRear'){
								return "There's an item in the front of the van.";
							}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'ExteriorRear'){
								return "Take a look inside the front compartment of the van.";
							}else{
								return "Take another look inside the van behind the building.";
							}
						}
					}else{
						return "No hint at this time.";
					}
					
				}
			}else{
				return "No hint at this time.";
			}
			
		}
		
		private function SolveBookShelf():String{
			if(game.SavedGame.SavedGameObj.data.BuildingOfficeBookCase != undefined){	
				if(game.SavedGame.SavedGameObj.data.BuildingOfficeBookCase['Solved'] == 'Yes'){	
					return DNACanisterHint();
				}else{
					if(game.SavedGame.SavedGameObj.data.ExteriorCarRear != undefined){
						if(game.SavedGame.SavedGameObj.data.ExteriorCarRear["Book"] != undefined){
							if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'BuildingOfficePainting'){
								return "There's something to do in this room.";
							}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'BuildingOfficeBack'){
								return "It's possible to solve the bookcase, take a closer look.";
							}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'BuildingOfficeTable'){
								return "There's something to do in this room.";
							}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'BuildingOfficeTablePaper'){
								return "There's something to do in this room.";
							}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'BuildingOfficeBookCase'){
								return "Try organizing the books so they spell a word.";
							}else{
								return "Something can be opened in the ground floor reading room.";
							}
						}else{
							if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'ExteriorCarRear'){
								return "Why not take a look at the book on the counter?";
							}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'ExteriorCarFront'){
								return "There's an item in the rear of the van.";
							}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'ExteriorRear'){
								return "Take a look inside the rear compartment of the van.";
							}else{
								return "There's a clue in the van that could be of assistance.";
							}
						}
					}else{
						return "No hint at this time.";
					}
				}
			}else{
				return "No hint at this time";
			}
			
		}
		
		private function DNACanisterHint():String{
			if(game.SavedGame.SavedGameObj.data.GeneticsRoomElectron != undefined){
				if(game.SavedGame.SavedGameObj.data.GeneticsRoomElectron['DNAAttached'] == 'Yes'){
					return ElectronCytosineHint();
				}else{
					return DNACanisterHintBUNDLE01();
				}
			}else{
				return DNACanisterHintBUNDLE01();
			}
			
		}
		
		private function DNACanisterHintBUNDLE01():String{
			
			if(game.SavedGame.SavedGameObj.data.DeepLabFridge != undefined){	
				if(game.SavedGame.SavedGameObj.data.DeepLabFridge['DNA'] == 'PickedUp'){	
					if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'GeneticsRoomElectron'){
						return "Try placing the pressurized container with the purple fluid into the slot on the left side of the microscope.";
					}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'GeneticsRoom'){
						return "Take a closer look at the powerful microscope on the left-hand side of the room.";
					}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'GeneticsRoomLensPuzzle'){
						return "Something can be done elsewhere in this room.";
					}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'GeneticsRoomBox'){
						return "Something can be done elsewhere in this room.";
					}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'GeneticsRoomDesk'){
						return "Something can be done elsewhere in this room.";
					}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'SpinWheel'){
						return "Something can be done elsewhere in this room.";
					}else{
						return "Something can be done in the genetics laboratory on the third floor.";
					}
				}else{
					if(game.SavedGame.SavedGameObj.data.DeepLabFridge['Door_1'] != undefined){
						if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'DeepLabFridge'){
							return "Why not pick up the pressurized container filled with the purple liquid from inside the refrigerator?";
						}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'DeepLab'){
							return "Something in the refrigerator can be picked up.";
						}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'DeepLabDesk'){
							return "Something in the refrigerator can be picked up.";
						}else{
							return "There's something deep in the laboratory, through the melted door, that can be picked up.";
						}
					}else{
						return DNACanisterHintBUNDLE00();
					}
				}
			}else{
				return DNACanisterHintBUNDLE00();
			}
		}
		
		private function DNACanisterHintBUNDLE00():String{
			if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'DeepLabFridge'){
				return "Try looking in the refrigerator."
			}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'DeepLab'){
				return "Try looking in the refrigerator."
			}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'DeepLabDesk'){
				return "Try looking in the refrigerator."
			}else{
				return "There are new places to explore. Continue investigating.";
			}
		}
		
		private function ElectronCytosineHint():String{	
			if(game.SavedGame.SavedGameObj.data.GeneticsRoomElectron != undefined){
				if(game.SavedGame.SavedGameObj.data.GeneticsRoomElectron['Bottle_c_Attached'] == 'Yes'){
					return ElectronAdenineHint()
				}else{
					return ElectronCytosineHintBUNDLE01()
				}
			}else{
				return ElectronCytosineHintBUNDLE01()
			}
			
		}
		
		private function ElectronCytosineHintBUNDLE01():String{
			if(game.SavedGame.SavedGameObj.data.GreenHouseDeepShelf != undefined){	
				if(game.SavedGame.SavedGameObj.data.GreenHouseDeepShelf['Vial'] == 'PickedUp'){
					if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'GeneticsRoomElectron'){
						return "See if the glass bottle filled with transparent red liquid can fit onto the machine.";
					}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'GeneticsRoom'){
						return "Take a look at the machine on left-hand side of the this room.";
					}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'GeneticsRoomMicroscope'){
						return "Something can be done with the outside of this microscope.";
					}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'GeneticsRoomLensPuzzle'){
						return "Something can be done elsewhere in this room.";
					}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'GeneticsRoomBox'){
						return "Something can be done elsewhere in this room.";
					}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'GeneticsRoomDesk'){
						return "Something can be done elsewhere in this room.";
					}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'SpinWheel'){
						return "Something can be done elsewhere in this room.";
					}else{
						return "Something can be done in the third floor genetics laboratory.";
					}
				}else{
					if(game.SavedGame.SavedGameObj.data.GreenHouseDeepShelf['Fridge'] != undefined){
						if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'GreenHouseDeepShelf'){
							return "Why not pick up the glass container from out of the small refrigerator.";
						}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'GreenHouseDeep'){
							return "An item can be picked up from the small refrigerator in this room.";
						}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'GreenHouseDeepBulb'){
							return "An item can be picked up in this room.";
						}else{ 
							return "Something can be found in the room behind the botany laboratory on the third floor.";
						}	
					}else{
						return ElectronCytosineHintBundle02();
					}
				}
			}else{
				
				return ElectronCytosineHintBundle02();
			}
		}
		
		
		private function ElectronCytosineHintBundle02():String{
			if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'GreenHouseDeepShelf'){
				return "Why not see what's inside the refrigerator ?";
			}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'GreenHouseDeep'){
				return "Why not see what's inside the refrigerator ?";
			}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'GreenHouseDeepBulb'){
				return "There are other things to discover in this room.";
			}else{
				return "Something can be done in the room behind the botany laboratory on the third floor.";
			}	
		}
		
		private function ElectronAdenineHint():String{
			if(game.SavedGame.SavedGameObj.data.GeneticsRoomElectron != undefined){
				if(game.SavedGame.SavedGameObj.data.GeneticsRoomElectron['Bottle_a_Attached'] == 'Yes'){
					return ElectronMicroscopeHouseLeverHints();
				}else{
					if(game.SavedGame.SavedGameObj.data.DeepLabFridge != undefined){	
						if(game.SavedGame.SavedGameObj.data.DeepLabFridge['Stone'] == 'PickedUp'){	
							if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'GeneticsRoomElectron'){
								return "See if the glass bottle filled with transparent red green can fit onto the machine.";
							}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'GeneticsRoom'){
								return "Take a look at the machine on left-hand side of the this room.";
							}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'GeneticsRoomMicroscope'){
								return "Something can be done with the outside of this microscope.";
							}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'GeneticsRoomLensPuzzle'){
								return "Something can be done elsewhere in this room.";
							}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'GeneticsRoomBox'){
								return "Something can be done elsewhere in this room.";
							}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'GeneticsRoomDesk'){
								return "Something can be done elsewhere in this room.";
							}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'SpinWheel'){
								return "Something can be done elsewhere in this room.";
							}else{
								return "Something can be done in the third genetics laboratory.";
							}
						}else{
							return ElectronAdenineHintBUNDLE();
						}
					}else{
						return "No hint at this time.";
					}
				}
			}else{
				return "No hint at this time.";
			}
			
		}
		private function ElectronAdenineHintBUNDLE():String{
			if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'DeepLabFridge'){
				return "Why not pick up the bottle filled with the green fluid?";
			}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'DeepLab'){
				return "Look inside the refrigerator, there's another item to find.";
			}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'DeepLabDesk'){
				return "An item can be picked up in this room.";
			}else{
				return "There's something to pick up deep inside the third floor laboratory.";
			}
		}
		
		
		private function ElectronMicroscopeHouseLeverHints():String{
			if(game.SavedGame.SavedGameObj.data.GeneticsRoomElectron != undefined){
				if(game.SavedGame.SavedGameObj.data.GeneticsRoomElectron['HoseAttached'] == 'Yes'){
					if(game.SavedGame.SavedGameObj.data.GeneticsRoomElectron['WheelTurned'] == 'Yes'){
						if(game.SavedGame.SavedGameObj.data.GeneticsRoomElectron['lever_g'] == 'Yes'){
							if(game.SavedGame.SavedGameObj.data.GeneticsRoomElectron['lever_a'] == 'Yes'){
								if(game.SavedGame.SavedGameObj.data.GeneticsRoomElectron['lever_c'] == 'Yes'){
									if(game.SavedGame.SavedGameObj.data.GeneticsRoomElectron['lever_t'] == 'Yes'){
										return ElectronMicroscopeHints();
									}else{
										return ElectronMicroscopeHouseLeverHintsBUNDLE00();
									}
								}else{
									return ElectronMicroscopeHouseLeverHintsBUNDLE00();
								}
							}else{
								return ElectronMicroscopeHouseLeverHintsBUNDLE00();
							}
						}else{
							return ElectronMicroscopeHouseLeverHintsBUNDLE00();
						}
					}else{
						if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'GeneticsRoomElectron'){
							return "Try turning the red wheel on top of the powerful microscope.";
						}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'GeneticsRoom'){
							return "It's possible to do something with the microscope to the left.";
						}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'GeneticsRoomLensPuzzle'){
							return "Something can be accomplished elsewhere in this room.";
						}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'GeneticsRoomBox'){
							return "Something can be accomplished elsewhere in this room.";
						}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'GeneticsRoomDesk'){
							return "Something can be accomplished elsewhere in this room.";
						}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'SpinWheel'){
							return "Something can be accomplished elsewhere in this room.";
						}else{
							return "There's something to do in the genetics laboratory.";
						}
					}
				}else{
					if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'GeneticsRoomElectron'){
						return "Try connecting the black hose to the pressurized container.";
					}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'GeneticsRoom'){
						return "It's possible to connect something to the microscope to the left.";
					}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'GeneticsRoomLensPuzzle'){
						return "Something can be accomplished elsewhere in this room.";
					}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'GeneticsRoomBox'){
						return "Something can be accomplished elsewhere in this room.";
					}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'GeneticsRoomDesk'){
						return "Something can be accomplished elsewhere in this room.";
					}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'SpinWheel'){
						return "Something can be accomplished elsewhere in this room.";
						
						
					}else{
						return "There's something to do in the genetics laboratory.";
					}
				}
			}else{
				return "No hint at this time.";
			}
			
			
			
		}
		private function ElectronMicroscopeHouseLeverHintsBUNDLE00():String{
			if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'GeneticsRoomElectron'){
				return "Try turning a lever on the device to the right of the microscope.";
			}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'GeneticsRoom'){
				return "It's possible to do something with the microscope on the left.";
			}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'GeneticsRoomLensPuzzle'){
				return "Something can be accomplished elsewhere in this room.";
			}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'GeneticsRoomBox'){
				return "Something can be accomplished elsewhere in this room.";
			}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'GeneticsRoomDesk'){
				return "Something can be accomplished elsewhere in this room.";
			}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'SpinWheel'){
				return "Something can be accomplished elsewhere in this room.";
			}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'GeneticsRoomMicroscope'){	
				return "Try pulling the levers on the device next to the microscope.";
			}else{
				return "There's something to do in the genetics laboratory.";
			}
		}
		
		private function ElectronMicroscopeHints():String{
			if(game.SavedGame.SavedGameObj.data.GeneticsRoomMicroscope != undefined){	
				if(game.SavedGame.SavedGameObj.data.GeneticsRoomMicroscope['Solved'] == 'yes'){	
					return ContainmentCircuitHandler();
				}else{
					return ElectronMicroscopeHintsBUNDLE01();
				}
			}else{
				return ElectronMicroscopeHintsBUNDLE01();
			}
			
		}
		
		
		
		
		
		private function ElectronMicroscopeHintsBUNDLE01():String{
			if(game.SavedGame.SavedGameObj.data.DeepLabDesk != undefined){	
				if(game.SavedGame.SavedGameObj.data.DeepLabDesk["Book"] != undefined){
					if(game.SavedGame.SavedGameObj.data.Lab != undefined){	
						if(game.SavedGame.SavedGameObj.data.Lab['Letter'] != undefined){
							if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'GeneticsRoomMicroscope'){
								return "The sequence of nucleic acids in these chains can be seen on the long print-out on the floor of the central laboratory.";
							}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'GeneticsRoomElectron'){
								return "It's possible to complete the sequence seen through the microscope. Take a closer look.";
							}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'GeneticsRoom'){
								return "It's possible to accomplish something with the powerful microscope.";
							}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'GeneticsRoomLensPuzzle'){
								return "Something can be accomplished elsewhere in this room.";
							}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'GeneticsRoomBox'){
								return "Something can be accomplished elsewhere in this room.";
							}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'GeneticsRoomDesk'){
								return "Something can be accomplished elsewhere in this room.";
							}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'SpinWheel'){
								return "Something can be accomplished elsewhere in this room.";
							}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'Lab'){
								return "The long print-out on the floor can help with the microscope in the genetics lab next door.";
							}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'LabDesk'){
								return "Something can be accomplished with the powerful microscope in the genetics lab.";
							}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'LabAsteriod'){
								return "Something can be accomplished with the powerful microscope in the genetics lab.";
							}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'LabAsteriodPuzzle'){
								return "Something can be accomplished with the powerful microscope in the genetics lab.";
							}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'DeepLab'){
								return "Something can be accomplished with the powerful microscope in the genetics lab.";
							}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'DeepLabFridge'){
								return "Something can be accomplished with the powerful microscope in the genetics lab.";
							}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'DeepLabDesk'){
								return "This book contains clues that can help with the powerful microscope in the genetics lab.";
							}else{
								return "Something can be accomplished with the powerful microscope in the genetics lab.";
							}
						}else{
							return ElectronMicroscopeHintsBUNDLE00();
						}
					}else{
						return ElectronMicroscopeHintsBUNDLE00();
					}
				}else{
					return ElectronMicroscopeHintsBUNDLE02();
				}
			}else{
				return ElectronMicroscopeHintsBUNDLE02();
			}
		}
		
		private function ElectronMicroscopeHintsBUNDLE02():String{
			if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'DeepLab'){
				return "Something can be accomplished with the powerful microscope in the genetics lab.";
			}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'DeepLabFridge'){
				return "There's a clue in this room.";
			}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'DeepLabDesk'){
				return "Take a look at the book here...";
			}else{
				return "There are more clues to discover.";
			}
		}
		
		private function ElectronMicroscopeHintsBUNDLE00():String{
			if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'Lab'){
				return "Take a look a the long print-out on the floor.";
			}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'LabDesk'){
				return "There's a clue in this room...";
			}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'LabAsteriod'){
				return "There's a helpful clue in this room."
			}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'LabAsteriodPuzzle'){
				return "There's a helpful clue in this room."
			}else{ 
				return "There are more clues to discover - search the third floor.";
			}	
			
		}
		
		private function ContainmentCircuitHandler():String{
			if(game.SavedGame.SavedGameObj.data.ContainmentControl != undefined){		
				if(game.SavedGame.SavedGameObj.data.ContainmentControl['Solved'] == 'Yes'){
					return NailSampleHint();
				}else{
					if(game.SavedGame.SavedGameObj.data.BuildingOfficeComputer != undefined){
						if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'ContainmentControl'){
							return "Information about this control station can be found on the computer in the copy room.";
							//return "Try varying the position of the different levers.";
						}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'Containment'){	
							return "Take a closer look at the control station on the left.";
						}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'ContainmentHatch'){
							return "See if the nearby control station can help at all.";
						}else{
							return "Something can be done deep underground.";
						}
					}else{
						if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'BuildingOfficeComputer'){
							return "Search this computer for information that can help with control station underground.";
						}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'BuildingOffice'){
							return "Take a closer look at the computer on the desk.";
						}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'BuildingOfficeDesk'){
							return "Take a closer look at the computer.";
						}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'BuildingOfficeCopier'){
							return "There's helpful information elsewhere in this room.";
						}else{
							return "There's a clue in the ground floor copy room.";
						}
					}
				}
			}else{
				
				if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'ContainmentControl'){
					return "Information on this control station can be found on the computer in the copy room.";
					//return "Try varying the position of the different levers.";
				}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'Containment'){	
					return "Take a closer look at the control station on the left.";
				}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'ContainmentHatch'){
					return "See if the nearby control station can help at all.";
				}else{
					return "Something can be done deep underground.";
				}
				
				
			}
			
		}
		
		private function NailSampleHint():String{
			if(game.SavedGame.SavedGameObj.data.GeneticsRoomBox != undefined){
				if(game.SavedGame.SavedGameObj.data.GeneticsRoomBox['Nails'] == 'Attached'){
					return GooBoxHint();
				}else{
					return NailSampleHintBUNDLE00();
				}
			}else{
				return NailSampleHintBUNDLE00();
			}
			
		}
		
		private function NailSampleHintBUNDLE00():String{
			if(game.SavedGame.SavedGameObj.data.BathroomCabinet != undefined){
				if(game.SavedGame.SavedGameObj.data.BathroomCabinet['Sample'] == 'PickedUp'){
					if(game.SavedGame.SavedGameObj.data.BuildingOfficeTablePaper != undefined){
						if(game.SavedGame.SavedGameObj.data.BuildingOfficeTablePaper['Nails'] == 'PickedUp'){
							if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'GeneticsRoomBox'){
								return "Try adding some genetic material from your inventory to the vat of jelly.";
							}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'GeneticsRoomLensPuzzle'){
								return "Try adding some genetic material from your inventory to the vat of jelly.";
							}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'GeneticsRoom'){
								return "Take a look at the machine on the far side of the room.";
							}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'GeneticsRoomDesk'){
								return "Something can be done elsewhere in this room.";								
							}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'GeneticsRoomElectron'){
								return "Something can be done elsewhere in this room.";		
							}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'SpinWheel'){
								return "Something can be done elsewhere in this room.";		
							}else{
								return "Something can be done in the third floor genetics room.";
							}							
						}else{
							return NailSampleHintBUNDLE01();
						}
					}else{
						return NailSampleHintBUNDLE01();
					}
				}else{
					return NailSampleHintBUNDLE02();
				}
			}else{
				return NailSampleHintBUNDLE02();
			}
			
		}
		
		private function NailSampleHintBUNDLE02():String{
			if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'BathroomCabinet'){
				return "Why not pick up the bottle of iodine from inside the medicine cabinet?";
			}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'Bathroom'){
				return "Take a closer look at the medicine cabinet.";
			}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'BathroomWall'){
				return "There's an item to pick up nearby.";
			}else{
				return "There's an item to pick up inside the bathroom.";
			}
		}
		
		private function NailSampleHintBUNDLE01():String{
			if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'BuildingOfficePainting'){
				return "There's an item to pick up elsewhere in this room.";
			}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'BuildingOfficeBack'){
				return "Take a closer look at the desk.";
			}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'BuildingOfficeTable'){
				return "Take a closer look at the paper on the desk.";
			}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'BuildingOfficeTablePaper'){
				return "Try using the tweezers and sample vial in your inventory to pick up the finger nails.";
			}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'BuildingOfficeBookCase'){
				return "There's an item to pick up elsewhere in this room.";
			}else{
				return "Look around, there are more items to pick up.";
			}
		}
		
		private function GooBoxHint():String{
			if(game.SavedGame.SavedGameObj.data.GeneticsRoomBox != undefined){
				if(game.SavedGame.SavedGameObj.data.GeneticsRoomBox['GooAttached'] == 'Yes'){
					return EyeGlassLensHint();
				}else{
					if(game.SavedGame.SavedGameObj.data.GeneticsRoomElectron != undefined){
						if(game.SavedGame.SavedGameObj.data.GeneticsRoomElectron['TestTubePickedUp'] == 'Yes'){
							if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'GeneticsRoomBox'){
								return "Try pouring some of the fluid in the test tube on the vat of jelly.";
							}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'GeneticsRoomLensPuzzle'){
								return "Try pouring some of the fluid in the test tube on the vat of jelly.";
							}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'GeneticsRoom'){
								return "Something can be done with the machine on the far side of the room.";
							}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'GeneticsDesk'){
								return "Something can be accomplished elsewhere in this room.";
							}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'GeneticsElectron'){
								return "Something can be accomplished elsewhere in this room."
							}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'Spinwheel'){
								return "Something can be accomplished elsewhere in this room."
							}else{
								return "Something can be in the third floor genetics laboratory.";
							}
						}else{
							if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'GeneticsRoomBox'){
								return "An item in this room can be picked up.";
							}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'GeneticsRoomLensPuzzle'){
								return "An item in this room can be picked up.";
							}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'GeneticsRoom'){
								return "An item in this room can be picked up.";
							}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'GeneticsDesk'){
								return "An item in this room can be picked up.";
							}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'GeneticsElectron'){
								return "Why not remove the test tube from the micrcoscope?"
							}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'Spinwheel'){
								return "An item in this room can be picked up.";
							}else{
								return "An item can be picked up in the third floor genetics laboratory.";
							}
						}
					}else{
						return "No hint at this time.";
					}
					
				}
			}else{
				return "No hint at this time.";
			}
			
		}
		
		private function EyeGlassLensHint():String{
			if(game.SavedGame.SavedGameObj.data.GeneticsRoomLensPuzzle != undefined){
				if(game.SavedGame.SavedGameObj.data.GeneticsRoomLensPuzzle['GlassLensAttached'] == 'Yes'){
					return SolveLensPuzzle();
				}else{
					return EyeGlassesLensHintBUNDLE02();
				}
			}else{
				return EyeGlassesLensHintBUNDLE02();
			}
			
		}
		
		private function EyeGlassesLensHintBUNDLE02():String{
			if(game.SavedGame.SavedGameObj.data.InvenPuzzle != undefined){
				if(game.SavedGame.SavedGameObj.data.InvenPuzzle['lens'] == 'yes'){
					return EyeGlassesLensHintBUNDLE03();
				}else{
					return EyeGlassesLensHintBUNDLE00();
				}
			}else{
				return EyeGlassesLensHintBUNDLE00();
			}
		}
		
		private function EyeGlassesLensHintBUNDLE03():String{
			if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'GeneticsRoomBox'){
				return "Take a closer look at the machine's large central emitter arm.";
			}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'GeneticsRoomLensPuzzle'){
				return "Try placing the lens from your inventory into the empty holder?";
			}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'GeneticsRoom'){
				return "Take a closer look at the machine in the far corner of this room.";
			}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'GeneticsDesk'){
				return "Take a closer look at the machine in the far corner of this room.";
			}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'GeneticsElectron'){
				return "Take a closer look at the machine in the far corner of this room.";
			}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'Spinwheel'){
				return "Take a closer look at the machine in the far corner of this room.";
			}else{
				return "An item can be used in the third floor genetics laboratory.";
			}
			
		}
		
		private function EyeGlassesLensHintBUNDLE00():String{
			if(game.SavedGame.SavedGameObj.data.SecondFloorCart != undefined){
				if(game.SavedGame.SavedGameObj.data.SecondFloorCart['eyeglasses'] == 'PickedUp'){
					if(game.SavedGame.SavedGameObj.data.BuildingOfficeTablePaper != undefined){
						if(game.SavedGame.SavedGameObj.data.BuildingOfficeTablePaper['Driver'] == 'PickedUp'){
							return "Try using the small screwdriver in your inventory on the broken" +
								" pair of glasses also in your inventory.";
						}else{
							return EyeGlassesLensHintBUNDLE01();
						}
					}else{
						return EyeGlassesLensHintBUNDLE01();
					}
				}else{
					if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'SecondFloorCart'){
						return "Why not pick up the broken eye-glasses?";
					}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'SecondFloorHall'){
						return "There's an item on the floor that can be picked up.";
					}else{
						return "There are items to pick up. Look around.";
					}
				}
			}else{
				return "No hint at this time.";
			}
		}
		
		
		private function EyeGlassesLensHintBUNDLE01():String{
			if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'BuildingOfficePainting'){
				return "There's an item to pick up elsewhere in this room.";
			}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'BuildingOfficeBack'){
				return "Take a closer look at the desk.";
			}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'BuildingOfficeTable'){
				return "Take a closer look at the paper on the desk.";
			}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'BuildingOfficeTablePaper'){
				return "Why not pick up the small screwdriver?";
			}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'BuildingOfficeBookCase'){
				return "There's an item to pick up elsewhere in this room.";
			}else{
				return "Look around, there are more items to pick up.";
			}
		}
		
		private function SolveLensPuzzle():String{
			if(game.SavedGame.SavedGameObj.data.GeneticsRoomLensPuzzle != undefined){
				if(game.SavedGame.SavedGameObj.data.GeneticsRoomLensPuzzle['Solved'] == 'Yes'){
					return OpenContainmentHatchHint();
				}else{
					if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'GeneticsRoomBox'){
						return "The beams on the central emitter arm need to be calibrated.";
					}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'GeneticsRoomLensPuzzle'){
						return "A clue in the second floor office can help with calibrating the beams.";
					}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'GeneticsRoom'){
						return "The beams on the central emitter arm need to be calibrated.";
					}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'GeneticsDesk'){
						return "The beams on the central emitter arm need to be calibrated.";
					}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'GeneticsElectron'){
						return "The beams on the central emitter arm need to be calibrated.";
					}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'Spinwheel'){
						return "The beams on the central emitter arm need to be calibrated.";
					}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'OfficeKitchenSink'){
						return "The information on this business card can help with the machine in the genetics laboratory.";
					}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'OfficeKitchen'){
						return "There's an important clue on the counter top.";
					}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'Office'){
						return "There's an important clue in this room.";
					}else{
						return "There's something important to do in the third floor genetics lab.";
					}
				}
			}else{
				return "No hint at this time.";
			}
			
		}
		
		
		
		private function OpenContainmentHatchHint():String{
			
			
			if(game.SavedGame.SavedGameObj.data.ContainmentHatch != undefined){	
				if(game.SavedGame.SavedGameObj.data.ContainmentHatch['Hand'] == 'Attached'){	
					if(game.SavedGame.SavedGameObj.data.ContainmentHatch['Hatch'] != undefined){	
						return ContainmentSwitchHint();
					}else{
						if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'ContainmentControl'){
							return "The hatch can be opened.";
						}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'Containment'){	
							return "The hatch can be opened.";
						}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'ContainmentHatch'){
							return "Why not open the hatch?";
						}else{
							return "There's a new area to explore. Look below.";
						}
					}
					
					
				}else{
					return OpenContainmentHatchHintBUNDLE00();
				}
			}else{
				return OpenContainmentHatchHintBUNDLE00();
			}
			
		}
		private function OpenContainmentHatchHintBUNDLE00():String{
			if(game.SavedGame.SavedGameObj.data.GeneticsRoomBox != undefined){
				if(game.SavedGame.SavedGameObj.data.GeneticsRoomBox['Hand'] == 'PickedUp'){
					
					if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'ContainmentControl'){
						return "See what can be done in front of the hatch.";
					}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'Containment'){	
						return "The hatch can be opened";
					}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'ContainmentHatch'){
						return "See if the control pad recognizes the hand...";
					}else{
						return "A new area can be opened. Look below.";
					}
				}else{
					
					if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'GeneticsRoomBox'){
						return "Why not pick up the hand?";
					}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'GeneticsRoom'){
						return "Why not pick up the hand from the machine in the corner?";
						
					}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'GeneticsDesk'){
						return "An item can be picked up elsewhere in this room."
						
					}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'GeneticsElectron'){
						return "An item can be picked up elsewhere in this room."
					}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'Spinwheel'){
						return "An item can be picked up elsewhere in this room."
						
					}else{
						return "There's an item to pick up in the third floor genetics laboratory.";
					}
					
				}
			}else{
				return "No hint at this time.";
			}
		}
		
		
		
		private function ContainmentSwitchHint():String{
			if(game.SavedGame.SavedGameObj.data.ContainmentCalibrator != undefined){
				if(game.SavedGame.SavedGameObj.data.ContainmentCalibrator['Solved'] == 'Yes'){
					return ContainmentCalibratorHint()
				}else{
					return ContaimentSwitchHintBUNDLE00();
				}
			}else{
				return ContaimentSwitchHintBUNDLE00();
				
			}
			
		}
		
		private function ContaimentSwitchHintBUNDLE00():String{
			if(game.SavedGame.SavedGameObj.data.ContainmentConsole != undefined){
				if(game.SavedGame.SavedGameObj.data.ContainmentConsole['SpinnerOn'] == 'Yes'){
					return ContainmentCalibratorHint();
				}else{
					return ContainmentSwitchHintBUNDLE00();
				}
			}else{
				return ContainmentSwitchHintBUNDLE00();
			}
		}
		
		private function ContainmentCalibratorHint():String{
			
			if(game.SavedGame.SavedGameObj.data.ContainmentCalibrator != undefined){
				if(game.SavedGame.SavedGameObj.data.ContainmentCalibrator['Solved'] == 'Yes'){
					return JarWaterHint();
				}else{
					return ContaimeSwitchHintBUNDLE02();
				}
			}else{
				return ContaimeSwitchHintBUNDLE02();
			}
			
		}
		
		/*	private function ContainmentSwitchHintBUNDLE01():String{
		if(game.SavedGame.SavedGameObj.data.ContainmentConsole != undefined){
		if(game.SavedGame.SavedGameObj.data.ContainmentConsole['SpinnerOn'] == 'Yes'){
		return ContaimeSwitchHintBUNDLE02();
		}else{
		return ContainmentSwitchHintBUNDLE00();
		}
		}else{
		return ContainmentSwitchHintBUNDLE00();
		}
		}
		*/	
		private function ContaimeSwitchHintBUNDLE02():String{
			if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'ContainmentCalibrator'){
				return "The same pattern can be seen in the description of the mineral used in the sculpture outside the building.";
			}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'ContainmentInterior'){
				return "It's possible to solve the console on the left.";
			}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'ContainmentConsole'){
				return "Take a look at the console on the other side of the chamber.";
			}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'Containment'){
				return "Something can be done inside the chamber...";
			}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'ContainmentControl'){
				return "Something can be done inside the chamber...";
			}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'ContainmentHatch'){
				return "Something can be done inside the chamber...";
			}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'ExteriorCubeInfo'){	
				return "The molecular pattern of the mineral described on this plaque can help with machinery in the chamber deep underground.";
			}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'ExteriorCube'){	
				return "Study the plaque beside the statue.";
			}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'Exterior'){		
				return "Study the plaque beside the statue.";
			}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'Lift'){	
				return "Study the poster hung on the wall.";
			}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'LiftWall'){		
				return "Study the poster hung on the wall.";
			}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'DeepLab'){	
				return "The papers on the floor can help with the machines in the basement.";
			}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'DeepLabFridge'){	
				return "There's a useful clue in this room.";
			}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'DeepLabDesk'){
				return "There's a useful clue in this room.";
			}else{
				return "It's possible to solve one of the consoles in the sealed chamber deep underground.";
				
				
			}
		}
		
		private function ContainmentSwitchHintBUNDLE00():String{
			if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'ContainmentCalibrator'){
				return "Try using the console on the other side of the chamber.";
			}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'ContainmentInterior'){
				return "See if anything can be done with the console on the right.";
			}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'ContainmentConsole'){
				return "Try using the console to activate the device at the center of the room.";
			}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'ContainmentQuantum'){
				return "Try using one of the control consoles in this room. ";
			}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'Containment'){
				return "Something can be done inside the chamber...";
			}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'ContainmentControl'){
				return "Something can be done inside the chamber...";
			}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'ContainmentHatch'){
				return "Something can be done inside the chamber...";
			}else{
				return "Investigate the chamber deep undergound.";
			}
		}
		
		
		private function JarWaterHint():String{
			
			if(game.SavedGame.SavedGameObj.data.GreenHouseTable != undefined){	
				if(game.SavedGame.SavedGameObj.data.GreenHouseTable['Jar'] == 'PickedUp'){
					if(game.SavedGame.SavedGameObj.data.GreenHouseDeepShelf != undefined){
						if(game.SavedGame.SavedGameObj.data.GreenHouseDeepShelf['Water'] == "PickedUp"){	
							return AddJarWaterToBurnerHint();
						}else{
							if(game.SavedGame.SavedGameObj.data.OfficeKitchenSink != undefined){	
								if(game.SavedGame.SavedGameObj.data.OfficeKitchenSink['Water'] == 'PickedUp'){	
									return AddJarWaterToBurnerHint();
								}else{
									if(game.SavedGame.SavedGameObj.data.Bathroom != undefined){	
										if(game.SavedGame.SavedGameObj.data.Bathroom['Water'] == 'PickedUp'){	
											return AddJarWaterToBurnerHint();
										}else{
											return JarWaterHintBUNDLE01();
										}
									}else{
										return "No hint at this time.";
									}
								}
							}else{
								return JarWaterHintBUNDLE01();
							}
						}
					}else{
						return JarWaterHintBUNDLE01();
					}
				}else{
					
					if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'GreenHouseTable'){
						return "Why not pick up the glass beaker from the table?";
					}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'GreenHouse'){
						return "There's an item to pick up on the table.";
					}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'GreenHouseVenus'){
						return "There's an item that can be picked up nearby.";
					}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'GreenHouseDeep'){
						return "There's an item elsewhere in the botany lab.";
					}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'GreenHouseBulb'){
						return "There's an item elsewhere in the botany lab.";
					}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'GreenHouseShelf'){
						return "There's an item elsewhere in the botany lab.";
					}else{
						return "There's an item that can be picked up in botany laboratory.";
					}	
				}
			}else{
				return "No hint at this time.";
			}
			
		}
		
		private function JarWaterHintBUNDLE01():String{
			if(game.SavedGame.SavedGameObj.data.DeepLabDesk != undefined){	
				if(game.SavedGame.SavedGameObj.data.DeepLabDesk['JarAttached'] == 'Yes'){			
					if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'DeepLabFridge'){
						return "Pick up the jar from the chemistry set.";
					}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'DeepLab'){
						return "Pick up the pyrex beaker. Something else needs to be done with it.";
					}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'DeepLabDesk'){
						return "Pick up the pyrex beaker. Something else needs to be done with it.";
					}else{
						return "There's something you'll need at the chemistry set on the third floor.";
					}
				}else{
					return JarWaterHintBUNDLE02();
				}
			}else{
				return JarWaterHintBUNDLE02();
			}
			
		}
		
		private function JarWaterHintBUNDLE02():String{
			if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'OfficeKitchen'){
				return "Try using the nearby sink...";
			}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'OfficeKitchenSink'){
				return "Try filling the pyrex beaker with water from the sink."
			}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'GreenHouseDeep'){
				return "Try using the nearby sink...";
			}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'GreenHouseDeepShelf'){
				return "Try filling the pyrex beaker with water from the sink."
			}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'GreenHouseDeepBulb'){
				return "Try using the nearby sink...";
			}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'Bathroom'){
				return "Try filling the pyrex beaker with water from the sink."
			}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'BathroomCabinet'){
				return "Try using the nearby sink...";
			}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'BathroomWall'){
				return "Try using the nearby sink...";
			}else{
				return "Look for a place where you can find water.";
			}
		}
		
		private function AddJarWaterToBurnerHint():String{
			trace("RIEP 00");
			if(game.SavedGame.SavedGameObj.data.DeepLabDesk != undefined){	
				trace("RIEP 01");
				if(game.SavedGame.SavedGameObj.data.DeepLabDesk['JarAttached'] == 'Yes'){	
					trace("RIEP 03");
					return RedRockHint();
				}else{
					trace("RIEP 04");
					return AddJarWaterToBurnerHintBUNDLE00();
				}
			}else{
				trace("RIEP 05");
				return AddJarWaterToBurnerHintBUNDLE00();
			}
			
		}
		
		private function AddJarWaterToBurnerHintBUNDLE00():String{
			if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'DeepLabFridge'){
				return "There's a place to use the pyrex beaker elsewhere in this room.";
			}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'DeepLab'){
				return "Place the pyrex beaker onto the platform above the bunsen burner on the counter.";
			}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'DeepLabDesk'){
				return "Place the pyrex beaker onto the platform above the bunsen burner on the counter.";
			}else{
				return "Something can be done with the chemistry experiment set up deep in the laboratory.";
			}
		}
		
		
		private function RedRockHint():String{
			trace("Fender 00");
			if(game.SavedGame.SavedGameObj.data.ExteriorCube != undefined){	
				trace("Fender 01");
				if(game.SavedGame.SavedGameObj.data.ExteriorCube['RedRock'] == 'PickedUp'){	
					trace("Fender 02");
					return AddRedRockToChemistry();
					//return JarWaterHint();
				}else{
					trace("Fender 03");
					if(game.SavedGame.SavedGameObj.data.BuildingOfficeTable != undefined){	
						trace("Fender 04");
						if(game.SavedGame.SavedGameObj.data.BuildingOfficeTable['Chisel'] == 'PickedUp'){	
							trace("Fender 05");
							if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'ExteriorCube'){
								trace("Fender 06");
								return "Try using an inventory item to obtain a sample of the mineral the statue is made of.";
							}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'ExteriorCubeInfo'){
								trace("Fender 07");
								return "Try using an inventory item to obtain a sample of the mineral in the nearby statue.";
							}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'Exterior'){
								trace("Fender 08");
								return "Take a closer look at the statue.";
							}else{
								trace("Fender 09");
								return "Take a close look at the statue outside of the front of building.";
							}
						}else{
							trace("Fender 10");
							if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'BuildingOfficePainting'){
								trace("Fender 11");
								return "There's an item to pick up elsewhere in this room.";
							}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'BuildingOfficeBack'){
								trace("Fender 12");
								return "Take a closer look at the desk.";
							}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'BuildingOfficeTable'){
								trace("Fender 13");
								return "Why not pick up the hammer and chisel on the desk?";
							}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'BuildingOfficeTablePaper'){
								trace("Fender 14");
								return "Elsewhere on this desk is an item to pick up.";
							}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'BuildingOfficeBookCase'){
								trace("Fender 15");
								return "There's an item to pick up elsewhere in this room.";
							}else{
								trace("Fender 16");
								return "Look around, there are more items to pick up.";
							}
						}
					}else{
						trace("Fender 17");
						return "No hint at this time.";
					}
					
				}
			}else{
				trace("Fender 18");
				return RedRockHintBUNDLE00();
			}
			
			//	return "";
		}
		
		
		
		private function RedRockHintBUNDLE00():String{
			if(game.SavedGame.SavedGameObj.data.BuildingOfficeTable != undefined){	
				if(game.SavedGame.SavedGameObj.data.BuildingOfficeTable['Chisel'] == 'PickedUp'){	
					trace("Fender 19");
					if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'ExteriorCube'){
						trace("Fender 20");
						return "Try using an inventory item to obtain a sample of the mineral the statue is made of.";
					}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'ExteriorCubeInfo'){
						trace("Fender 21");
						return "Try using an inventory item to obtain a sample of the mineral from the nearby statue.";
					}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'Exterior'){
						trace("Fender 22");
						return "Take a closer look at the statue.";
					}else{
						trace("Fender 23");
						return "Take a close look at the statue outside of the front of building.";
					}
				}else{
					if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'BuildingOfficePainting'){
						trace("Fender 24");
						return "There's an item to pick up elsewhere in this room.";
					}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'BuildingOfficeBack'){
						trace("Fender 25");
						return "Take a closer look at the desk.";
					}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'BuildingOfficeTable'){
						trace("Fender 26")
						return "Why not pick up the hammer and chisel on the desk?";
					}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'BuildingOfficeTablePaper'){
						trace("Fender 27")
						return "There's an item elsewhere on this desk to pick up.";
					}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'BuildingOfficeBookCase'){
						trace("Fender 28")
						return "There's an item to pick up elsewhere in this room.";
					}else{
						trace("Fender 29")
						return "Look around, there are more items to pick up.";
					}
				}
			}else{
				trace("Fender 30")
				return "No hint at this time.";
			}
		}
		
		
		private function AddRedRockToChemistry():String{
			if(game.SavedGame.SavedGameObj.data.DeepLabDesk != undefined){	
				if(game.SavedGame.SavedGameObj.data.DeepLabDesk['RockAttached'] == 'Yes'){	
					return AddIodineToChemistry();
				}else{
					if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'DeepLabFridge'){
						return "Take a look at the chemistry set on the other side of this room.";
					}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'DeepLab'){
						return "See if you can use the piece of red mineral in the chemistry experiment...";
					}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'DeepLabDesk'){
						return "Try adding the piece of red mineral to the beaker.";
					}else{
						return "Something can be done with the chemistry experiment set up deep in the laboratory.";
					}
				}
			}else{
				return "No hint at this time.";
			}
			
		}
		
		
		
		private function AddIodineToChemistry():String{
			if(game.SavedGame.SavedGameObj.data.DeepLabDesk != undefined){	
				if(game.SavedGame.SavedGameObj.data.DeepLabDesk['IodineAttached'] == 'Yes'){	
					return AddGooToChemistySet();
				}else{
					if(game.SavedGame.SavedGameObj.data.BathroomCabinet != undefined){	
						if(game.SavedGame.SavedGameObj.data.BathroomCabinet['Iodine'] == 'PickedUp'){							
							if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'DeepLabFridge'){
								return "Try using the iodine in the chemistry experiment on the other side of this room.";
							}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'DeepLab'){
								return "Try using the iodine in the chemistry experiment on the desk.";
							}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'DeepLabDesk'){
								return "Try adding some iodine to the beaker.";
							}else{
								return "Something can be done with the chemistry experiment set up deep in the laboratory.";
							}
						}else{
							if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'BathroomCabinet'){
								return "Why not pick up the bottle of iodine from the cabinet?";
							}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'Bathroom'){
								return "There's something in the medicine cabinet.";
							}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'BathroomWall'){
								return "There's something in the nearby medicine cabinet.";
							}else{
								return "There's an item to pick up in the second floor bathroom.";
							}
						}
					}else{
						return "No hint at this time.";
					}
				}
			}else{
				return "No hint at this time.";		
			}
			
		}
		
		
		
		private function AddGooToChemistySet():String{
			if(game.SavedGame.SavedGameObj.data.DeepLabDesk != undefined){	
				if(game.SavedGame.SavedGameObj.data.DeepLabDesk['DNAAttached'] == 'Yes'){
					return SolveChemistrySet();
				}else{
					if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'DeepLabFridge'){
						return "More can be done with the chemistry experiment on the other side of the room.";
					}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'DeepLab'){
						return "More can be done with the chemistry experiment.";
					}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'DeepLabDesk'){
						return "Maybe the purple fluid in the test tube could be helpful here.";
					}else{
						return "More can be done with the chemistry experiment set up deep in the laboratory.";
					}
				}
			}else{
				return "No hint at this time.";
			}
			
			
		}
		
		private function SolveChemistrySet():String{
			if(game.SavedGame.SavedGameObj.data.DeepLabDesk != undefined){	
				if(game.SavedGame.SavedGameObj.data.DeepLabDesk['DNARockFried'] == 'Yes'){
					return LoadInjectorHint();
				}else{
					if(game.SavedGame.SavedGameObj.data.DeepLabDesk['RockMelted'] == 'Yes'){	
						if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'DeepLabFridge'){
							return "More can be done with the chemistry experiment on the other side of the room.";
						}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'DeepLab'){
							return "More can be done with the chemistry experiment.";
						}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'DeepLabDesk'){
							return "Try turning on the electrical power source...";
						}else{
							return "More can be done with the chemistry experiment set up deep in the laboratory.";
						}
					}else{
						if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'DeepLabFridge'){
							return "More can be done with the chemistry experiment on the other side of the room.";
						}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'DeepLab'){
							return "More can be done with the chemistry experiment.";
						}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'DeepLabDesk'){
							return "Try igniting the bunson burner.";
						}else{
							return "More can be done with the chemistry experiment set up deep in the laboratory.";
						}
					}
				}
			}else{
				return "No hint at this time.";	
			}
			
		}
		
		private function LoadInjectorHint():String{
			if(game.SavedGame.SavedGameObj.data.DeepLabDesk != undefined){	
				if(game.SavedGame.SavedGameObj.data.DeepLabDesk['SamplePickedUp'] == 'Yes'){				
					return PlaceTemplateHint();
				}else{
					if(game.SavedGame.SavedGameObj.data.DeepLabFridge != undefined){	
						if(game.SavedGame.SavedGameObj.data.DeepLabFridge['Injector'] == 'PickedUp'){	
							if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'DeepLabFridge'){
								return "More can be done with the chemistry experiment on the other side of the room.";
							}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'DeepLab'){
								return "More can be done with the chemistry experiment.";
							}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'DeepLabDesk'){
								return "Try using the multi-sample pipette to capture a bit of the purple gelatin.";
							}else{
								return "More can be done with the chemistry experiment set up deep in the laboratory.";
							}
						}else{
							if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'DeepLabFridge'){
								return "Why not pick up the large pipette from the shelf?";
							}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'DeepLab'){
								return "More can be done with the chemistry experiment.";
							}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'DeepLabDesk'){
								return "An item can be picked up elsewhere in this room.";
							}else{
								return "An item can be picked up in the storage room deep in the laboratory.";
							}
						}
					}else{
						return "No hint at this time.";
					}
				}
			}else{
				return "No hint at this time.";
			}
			
		}
		
		private function PlaceTemplateHint():String{
			if(game.SavedGame.SavedGameObj.data.SpinWheel != undefined){	
				if(game.SavedGame.SavedGameObj.data.SpinWheel['TemplateFull'] == 'Yes'){			
					return SpinWheelSolveHint();
				}else{
					return PlaceTemplateHintBUNDLE00();
				}
			}else{
				return PlaceTemplateHintBUNDLE00();
			}
			
		}
		
		private function PlaceTemplateHintBUNDLE00():String{
			if(game.SavedGame.SavedGameObj.data.SpinWheel != undefined){	
				if(game.SavedGame.SavedGameObj.data.SpinWheel['TemplateAttached'] == 'Yes'){
					if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'SpinWheel'){
						return "Try using the multi-sample pipette here.";
					}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'GeneticsRoomDesk'){
						return "Try using the multi-sample pipette with the machine here.";
					}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'GeneticsRoom'){	
						return "Take a closer look at the machine on the table in the center of the room.";
					}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'GeneticsRoomElectron'){	
						return "An item can be used elsewhere in this room.";
					}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'GeneticsRoomBox'){
						return "An item can be used elsewhere in this room.";
					}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'GeneticsRoomLensPuzzle'){
						return "An item can be used elsewhere in this room.";
					}else{
						return "An item can be used in the third floor genetics laboratory.";
					}
				}else{
					return PlaceTemplateHintBUNDLE01();
				}
			}else{
				return PlaceTemplateHintBUNDLE01();
			}
		}
		
		private function PlaceTemplateHintBUNDLE01():String{
			if(game.SavedGame.SavedGameObj.data.DeepLabDesk != undefined){	
				if(game.SavedGame.SavedGameObj.data.DeepLabDesk['Cell'] == 'PickedUp'){	
					if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'SpinWheel'){
						return "An item can be attached to the slot on right side.";
					}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'GeneticsRoomDesk'){
						return "An item can be attached to the slot on right side of the machine here.";
					}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'GeneticsRoom'){	
						return "Take a closer look at the machine on the table in the center of the room.";
					}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'GeneticsRoomElectron'){	
						return "An item can be used elsewhere in this room.";
					}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'GeneticsRoomBox'){
						return "An item can be used elsewhere in this room.";
					}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'GeneticsRoomLensPuzzle'){
						return "An item can be used elsewhere in this room.";
					}else{
						return "An item can be used in the third floor genetics laboratory.";
					}
				}else{
					
					if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'DeepLabFridge'){
						return "There's an item in this room that can be picked up.";
					}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'DeepLab'){
						return "There's an item beside the chemistry experiment that can be picked up.";
					}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'DeepLabDesk'){
						return "Why not pick up the rectangular plate from the counter top?";
					}else{
						return "An item can be picked up from the storage room deep in the laboratory.";
					}
				}
			}else{
				return "No hint at this time."
			}
		}
		
		private function SpinWheelSolveHint():String{
			if(game.SavedGame.SavedGameObj.data.SpinWheel != undefined){
				if(game.SavedGame.SavedGameObj.data.SpinWheel["Solved"] == 'Yes'){
					return PickUpCupHints();
				}else{
					return SpinWheelSolveHintBUNDLE00();
				}
				
			}else{
				return SpinWheelSolveHintBUNDLE00();
			}
			
		}
		
		
		private function SpinWheelSolveHintBUNDLE00():String{
			if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'SpinWheel'){
				return "See if you can arrange all the dots so they become pink. A clue can be found in the ground floor reading room.";
			}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'GeneticsRoomDesk'){
				return "It's possible to solve the machine on table here. A clue can be found in the ground floor reading room.";
			}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'GeneticsRoom'){	
				return "It's possible to solve the machine on the table in the center of the room.";
			}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'GeneticsRoomElectron'){	
				return "It's possible to solve the machine on the table in the center of the room.";
			}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'GeneticsRoomBox'){
				return "It's possible to solve the machine on the table in the center of the room.";
			}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'GeneticsRoomLensPuzzle'){
				return "It's possible to solve the machine on the table in the center of the room.";
			}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'BuildingOfficePainting'){
				return "There's a helpful clue elsewhere in this room.";
			}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'BuildingOfficeBack'){
				return "The information on the chalk board can be useful.";
			}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'BuildingOfficeChalkboard'){
				return "The information on the chalk board can be useful.";
			}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'BuildingOfficeTable'){
				return "The information on the chalk board can be useful.";
			}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'BuildingOfficeTablePaper'){
				return "There's a helpful clue elsewhere in this room.";
			}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'BuildingOfficeBookCase'){
				return "There's a helpful clue elsewhere in this room.";
			}else{
				return "It's possible to solve something in the genetic lab on the third floor.";
			}
			
		}
		
		private function PickUpCupHints():String{
			if(game.SavedGame.SavedGameObj.data.GeneticsRoomDesk != undefined){	
				if(game.SavedGame.SavedGameObj.data.GeneticsRoomDesk['Cup'] == 'PickedUp'){
					return IgniteCupHints();
				}else{
					if(game.SavedGame.SavedGameObj.data.Lift != undefined){	
						if(game.SavedGame.SavedGameObj.data.Lift['Handler'] == 'PickedUp'){	
							return PickUpCupHintsBUNDLE00();
						}else{
							return PickUpCupHintsBUNDLE01();
						}
					}else{
						return PickUpCupHintsBUNDLE01();
					}
				}
			}else{
				return "No hint at this time.";
			}
			
			
		}
		
		private function PickUpCupHintsBUNDLE01():String{
			if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'Lift'){
				return "Why not pick up the pair of metal tongs?";
			}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'LiftWall'){
				return "Why not pick up the nearby pair of metal tongs?";
			}else{
				return "There's a useful item in the hidden elevator room through the " +
					"hidden door in the ground floor reading room.";
			}
		}
		
		private function PickUpCupHintsBUNDLE00():String{
			if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'GeneticsRoomDesk'){
				return "Try using the metal tongs to grasp the freezing cup inside the machine.";
			}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'GeneticsRoom'){	
				return "Try using an inventory item to pick up the cup in the machine on the desk.";
			}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'GeneticsRoomElectron'){	
				return "Something can be picked up elsewhere in this room.";
			}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'GeneticsRoomBox'){
				return "Something can be picked up elsewhere in this room.";
			}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'GeneticsRoomLensPuzzle'){
				return "Something can be picked up elsewhere in this room.";
			}else{
				return "Something can be done in the third floor genetics laboratory.";
			}
		}
		
		private function IgniteCupHints():String{
			if(game.SavedGame.SavedGameObj.data.RocketRoom != undefined){	
				if(game.SavedGame.SavedGameObj.data.RocketRoom['Creature'] == 'Alive'){	
					return CrateOpenHint();
				}else{
					return IgniteCupHintsBUNDLE00();
				}
			}else{
				return IgniteCupHintsBUNDLE00();
			}
			
		}
		
		private function IgniteCupHintsBUNDLE00():String{
			if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'RocketRoomComputerDesk'){
				return "Take a look at the rocket engine in this room.";
			}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'RocketRoomComputer'){
				return "Take a look at the rocket engine in this room.";
			}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'RocketRoom'){
				return "Try heating up the freezing cup.";
			}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'RocketRoomSat'){
				return "Take a look at the rocket engine in this room.";
			}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'RocketRoomSatStation'){	
				return "Take a look at the rocket engine in this room.";
			}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'RocketRoomDesk'){
				return "Take a look at the rocket engine in this room.";
			}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'RocketRoomBoard'){
				return "Take a look at the rocket engine in this room.";
			}else{
				return "See what can be done in the rocketry research room on the second floor.";
			}
		}
		
		private function CrateOpenHint():String{
			if(game.SavedGame.SavedGameObj.data.ExteriorCarRear != undefined){
				if(game.SavedGame.SavedGameObj.data.ExteriorCarRear['CaseUnlocked'] == 'Yes'){	
					return RockChiselHint();
				}else{
					if(game.SavedGame.SavedGameObj.data.Lift != undefined){	
						if(game.SavedGame.SavedGameObj.data.Lift['Crowbar'] == 'PickedUp'){	
							if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'ExteriorCarRear'){
								return "See if the crowbar can help open the crate...";
							}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'ExteriorRear'){
								return "Something can be done in the back of the van.";
							}else{
								return "Something can be done in the van behind the building.";
							}
						}else{
							if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'Lift'){
								return "Why not pick up the crowbar?";
							}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'LiftWall'){
								return "Why not pick up the nearby crowbar?";
							}else{
								return "There's a useful item in the hidden elevator room through the " +
									"hidden door in the ground floor reading room.";
							}
						}
					}else{
						return "No hint at this time.";
					}
				}
			}else{
				return "No hint at this time.";  
			}
			
		}
		private function RockChiselHint():String{
			if(game.SavedGame.SavedGameObj.data.ExteriorCarRear != undefined){
				if(game.SavedGame.SavedGameObj.data.ExteriorCarRear['ChiselUsed'] == 'Yes'){
					return RockDrillHint();
				}else{
					if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'ExteriorCarRear'){
						return "See if the chisel and hammer can help free the piece of stone.";
					}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'ExteriorRear'){
						return "Something can be done in the back of the van.";
					}else{
						return "Something can be done in the van behind the building.";
					}
				}	
			}else{
				return "No hint at this time.";
			}
			
		}
		private function RockDrillHint():String{
			if(game.SavedGame.SavedGameObj.data.ExteriorCarRear != undefined){
				if(game.SavedGame.SavedGameObj.data.ExteriorCarRear['DrillUsed'] == 'Yes'){	
					return PlaceStoneOneHint();
				}else{
					if(game.SavedGame.SavedGameObj.data.RocketRoomSatStation != undefined){
						if(game.SavedGame.SavedGameObj.data.RocketRoomSatStation['DrillPickedUp'] == 'Yes'){
							if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'ExteriorCarRear'){
								return "See if the electric drill can help free the piece of stone.";
							}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'ExteriorRear'){
								return "Something can be done in the back of the van.";
							}else{
								return "Something can be done in the van behind the building.";
							}
						}else{
							return RockDrillHintBUNDLE00();
						}
					}else{
						return RockDrillHintBUNDLE00();
					}
				}
			}else{
				return "No hint at this time.";
			}
			
		}
		
		private function RockDrillHintBUNDLE00():String{
			if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'RocketRoomComputerDesk'){
				return "An item can be picked up elsewhere in this room.";
			}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'RocketRoomComputer'){
				return "An item can be picked up elsewhere in this room.";
			}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'RocketRoom'){
				return "Take a look over near the satellite.";
			}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'RocketRoomSat'){
				return "An item can be picked up elsewhere in this room.";
			}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'RocketRoomSatStation'){	
				return "Why not pick up the electric drill?";
			}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'RocketRoomDesk'){
				return "An item can be picked up elsewhere in this room.";
			}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'RocketRoomBoard'){
				return "An item can be picked up elsewhere in this room.";
			}else{
				return "There's something useful in the second floor rocketry research room.";
			}
			
		}
		
		private function PlaceStoneOneHint():String{
			if(game.SavedGame.SavedGameObj.data.LabAsteriodPuzzle != undefined){
				if(game.SavedGame.SavedGameObj.data.LabAsteriodPuzzle['Piece02Attached'] == 'Yes'){
					return OpenSatHint();
				}else{
					return PlaceStoneOneHintBUNDLE00();
				}
			}else{
				return PlaceStoneOneHintBUNDLE00();
			}						
		}
		
		private function PlaceStoneOneHintBUNDLE00():String{
			if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'LabDesk'){
				return "Something can be done elsewhere in this room.";
			}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'Lab'){
				return "Take a closer look at the asteroid.";
			}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'LabAsteriod'){
				return "Take a closer look at the circular depression in the asteriod.";
			}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'LabAsteriodPuzzle'){
				return "See if the strange patterned stone fits into the any of the depressions in the asteriod.";
			}else{
				return "Something can be solved in the central laboratory.";
			}
		}
		
		private function OpenSatHint():String{
			if(game.SavedGame.SavedGameObj.data.RocketRoomSat != undefined){				
				if(game.SavedGame.SavedGameObj.data.RocketRoomSat['CoverRemoved'] == 'Yes'){
					return PickUpStoneBallHint();
				}else{
					return OpenSatHintBUNDLE00();
				}
			}else{
				return OpenSatHintBUNDLE00();
			}
			
		}
		
		private function OpenSatHintBUNDLE00():String{
			if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'RocketRoomComputerDesk'){
				return "Something can be opened elsewhere in the room.";
			}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'RocketRoomComputer'){
				return "Something can be opened elsewhere in the room.";
			}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'RocketRoom'){
				return "Take a closer look at the satellite.";
			}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'RocketRoomSat'){
				return "Try using the screwdriver to remove some of the satellite's outer casing";
			}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'RocketRoomSatStation'){	
				return "Take a closer look at the satellite.";
			}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'RocketRoomDesk'){
				return "Something can be opened elsewhere in the room.";
			}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'RocketRoomBoard'){
				return "Take a look at the nearby body of the satellite.";
			}else{
				return "Something can be done in the second floor rocketry research room.";
			}
		}
		
		
		private function PickUpStoneBallHint():String{
			if(game.SavedGame.SavedGameObj.data.RocketRoomSat != undefined){	
				if(game.SavedGame.SavedGameObj.data.RocketRoomSat['OrbPickedUp'] == 'Yes'){
					return PlaceStoneOrbHint();
				}else{
					if(game.SavedGame.SavedGameObj.data.GreenHouseTable != undefined){
						if(game.SavedGame.SavedGameObj.data.GreenHouseTable['Tongs'] == 'PickedUp'){
							if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'RocketRoomComputerDesk'){
								return "Something can be picked up elsewhere in the room.";
							}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'RocketRoomComputer'){
								return "Something can be picked up elsewhere in the room.";
							}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'RocketRoom'){
								return "Take a closer look at the satellite.";
							}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'RocketRoomSat'){
								return "Try using the forceps to get a better grip on the stone.";
							}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'RocketRoomSatStation'){	
								return "Take a closer look at the satellite.";
							}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'RocketRoomDesk'){
								return "Something can be picked up elsewhere in the room.";
							}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'RocketRoomBoard'){
								return "Take a look at the nearby satellite.";
							}else{
								return "Something can be done in the second floor rocketry research room.";
							}
						}else{
							if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'GreenHouseTable'){
								return "Why not pick up the forceps from the table?";
							}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'GreenHouse'){
								return "There's an item to pick up on the table.";
							}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'GreenHouseVenus'){
								return "There's an item that can be picked up nearby.";
							}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'GreenHouseDeep'){
								return "There's an item elsewhere in the botany lab.";
							}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'GreenHouseBulb'){
								return "There's an item elsewhere in the botany lab.";
							}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'GreenHouseShelf'){
								return "There's an item elsewhere in the botany lab.";
							}else{
								return "There's an item that can be picked up in the botany laboratory.";
							}	
						}
					}else{
						return "No hint at this time";
					}
				}
			}else{
				return "No hint at this time.";	
			}
			
		}
		
		private function PlaceStoneOrbHint():String{
			if(game.SavedGame.SavedGameObj.data.LabAsteriodPuzzle != undefined){
				if(game.SavedGame.SavedGameObj.data.LabAsteriodPuzzle['PieceBallAttached'] == 'Yes'){
					return PlaceStoneTwoHint();
				}else{
					return PlaceStoneOrbHintBUNDLE00();
				}
			}else{
				return PlaceStoneOrbHintBUNDLE00();
			}						
			
		}
		
		
		private function PlaceStoneOrbHintBUNDLE00():String{
			if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'LabDesk'){
				return "Something can be done elsewhere in this room.";
			}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'Lab'){
				return "Take a closer look at the asteroid.";
			}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'LabAsteriod'){
				return "Take a closer look at the circular depression in the asteriod.";
			}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'LabAsteriodPuzzle'){
				return "See if the spherical stone fits into the depression in the center asteriod.";
			}else{
				return "Something can be done in the central laboratory.";
			}
		}
		
		
		private function PlaceStoneTwoHint():String{
			if(game.SavedGame.SavedGameObj.data.LabAsteriodPuzzle != undefined){
				if(game.SavedGame.SavedGameObj.data.LabAsteriodPuzzle['Piece00Attached'] == 'Yes'){
					return PlaceStoneThreeHint();
				}else{
					if(game.SavedGame.SavedGameObj.data.GeneticsRoomDesk != undefined){	
						if(game.SavedGame.SavedGameObj.data.GeneticsRoomDesk['Stone'] == 'PickedUp'){
							if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'LabDesk'){
								return "Something can be done elsewhere in this room.";
							}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'Lab'){
								return "Take a closer look at the asteroid.";
							}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'LabAsteriod'){
								return "Take a closer look at the circular depression in the asteriod.";
							}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'LabAsteriodPuzzle'){
								return "See if the strange patterned stone fits into any of the depressions in the asteriod.";
							}else{
								return "Something can be done in the central laboratory.";
							}
						}else{
							if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'GeneticsRoomElectron'){
								return "There's an item elsewhere in this room that can be picked up.";
							}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'GeneticsRoom'){
								return "There's an item in this room that can be picked up.";
							}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'GeneticsRoomMicroscope'){
								return "There's an item elsewhere in this room that can be picked up.";
							}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'GeneticsRoomLensPuzzle'){
								return "There's an item elsewhere in this room that can be picked up.";
							}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'GeneticsRoomBox'){
								return "There's an item elsewhere in this room that can be picked up.";
							}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'GeneticsRoomDesk'){
								return "Why not pick up the stone slab from off the counter top?";
							}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'SpinWheel'){
								return "An item can be picked up nearby.";
							}else{
								return "An item can be picked up - continue the search.";
							}
						}
					}else{
						return "No hint at this time.";
					}
				}
			}else{
				return "No hint at this time.";
			}
			
		}
		
		private function PlaceStoneThreeHint():String{
			if(game.SavedGame.SavedGameObj.data.LabAsteriodPuzzle != undefined){
				if(game.SavedGame.SavedGameObj.data.LabAsteriodPuzzle['Piece04Attached'] == 'Yes'){
					return SolveAsteroidHint();
				}else{
					if(game.SavedGame.SavedGameObj.data.GreenHouseDeepShelf != undefined){
						if(game.SavedGame.SavedGameObj.data.GreenHouseDeepShelf['Stone'] == 'PickedUp'){
							if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'LabDesk'){
								return "Something can be done elsewhere in this room.";
							}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'Lab'){
								return "Take a closer look at the asteroid.";
							}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'LabAsteriod'){
								return "Take a closer look at the circular depression in the asteriod.";
							}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'LabAsteriodPuzzle'){
								return "See if the strange patterned stone fits into the any of the depressions in the asteriod.";
							}else{
								return "Something can be done in the central laboratory.";
							}
						}else{
							if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'GreenHouseDeepShelf'){
								return "Why not pick up the stone slab from the counter top?";
							}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'GreenHouseDeep'){
								return "Why not pick up the stone slab from the counter top?";
							}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'GreenHouseDeepBulb'){
								return "There's an item in this room.";
							}else{
								return "There are more items to find - continue the search.";
							}
						}
					}else{						
						return "No hint at this time.";
					}
				}
			}else{
				return "No hint at this time.";
			}
		}
		
		private function SolveAsteroidHint():String{
			if(game.SavedGame.SavedGameObj.data.LabAsteriodPuzzle != undefined){
				if(game.SavedGame.SavedGameObj.data.LabAsteriodPuzzle['Solved'] == "Yes"){
					return PlaceBlueBallHint();
				}else{
					return BathroomMirrorHint();
				}
				
			}else{
				return "No hint at this time.";
			}
			
		}
		
		private function BathroomMirrorHint():String{
			if(game.SavedGame.SavedGameObj.data.Bathroom != undefined){	
				if(game.SavedGame.SavedGameObj.data.Bathroom['MirrorUnlocked'] == 'Yes'){	
					if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'LabDesk'){
						return "It's possible to align the nearby asteroid's discs.";
					}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'Lab'){
						return "It's possible to align the asteroid's discs.";
					}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'LabAsteriod'){
						return "It's possible to align the asteroid's discs, look closer.";
					}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'LabAsteriodPuzzle'){
						return "Try aligning all of the discs so a spiral pattern emerges.";
					}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'Bathroom'){	
						return "The markings behind the mirror can help with the asteriod in the lab.";
					}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'BathroomWall'){		
						return "These markings can help with the asteriod in the lab.";
					}else{
						return "Something can be solved in the central laboratory.";
					}	
				}else{
					if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'Bathroom'){	
						return "Try to find a way to remove the mirror from the wall";
					}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'BathroomCabinet'){
						return "Take a look at the mirror in this room.";
					}else{
						return "Look around for another place to use the screwdriver...";
					}
				}
			}else{
				return "No hint at this time.";
			}
		}
		
		private function PlaceBlueBallHint():String{
			if(game.SavedGame.SavedGameObj.data.ContainmentQuantum != undefined){
				if(game.SavedGame.SavedGameObj.data.ContainmentQuantum['BlueAttached'] == 'Yes'){
					return PlaceRedBallHint();
				}else{
					return PlaceBlueBallHintBUNDLE00();
				}
			}else{
				return PlaceBlueBallHintBUNDLE00();
			}
			
		}
		
		private function PlaceBlueBallHintBUNDLE00():String{
			if(game.SavedGame.SavedGameObj.data.LabAsteriodPuzzle != undefined){	
				if(game.SavedGame.SavedGameObj.data.LabAsteriod['Pearl'] == 'PickedUp'){	
					if(game.SavedGame.SavedGameObj.data.ContainmentConsole != undefined){
						if(game.SavedGame.SavedGameObj.data.ContainmentConsole['SpinnerOn'] == 'Yes'){
							if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'ContainmentInterior'){	
								return "Try to get a closer look at what is happening at the epicenter of the machine.";
							}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'ContainmentCalibrator'){
								return "Try using the console on the other side of the chamber";
							}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'ContainmentConsole'){
								return "Try to stop the rotation of the machine.";
							}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'Containment'){
								return "Something can be done inside the chamber.";
							}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'ContainmentHatch'){
								return "Something can be done inside the chamber.";
							}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'ContainmentControl'){
								return "Something can be done inside the chamber.";
							}else{
								return "Something can be done underground.";
							}
						}else{
							if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'ContainmentQuantum'){
								return "Try adding the blue orb from your inventory to the anomaly.";
							}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'ContainmentInterior'){	
								return "Take a closer look at the anomaly.";
							}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'ContainmentCalibrator'){
								return "Take a look at the anomaly in the machine at the center of the chamber.";
							}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'ContainmentConsole'){
								return "Take a look at the anomaly in the machine at the center of the chamber.";
							}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'Containment'){
								return "Something can be done inside the chamber.";
							}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'ContainmentHatch'){
								return "Something can be done inside the chamber.";
							}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'ContainmentControl'){
								return "Something can be done inside the chamber.";
							}else{
								return "Something can be done underground.";
							}
						}
					}else{
						return "No hint at this time.";
					}
				}else{
					if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'Lab'){
						return "Take a closer look at the remnants of the asteroid.";
					}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'LabDesk'){
						return "There's an item to pick up elsewhere in this room.";
					}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'LabAsteriod'){
						return "Try picking up the floating luminescent blue orb.";
					}else{ 
						return "There's an item nearby to pick up.";
					}	
					
				}
			}else{
				return "No hint at this time.";
			}
		}
		
		private function PlaceRedBallHint():String{
			if(game.SavedGame.SavedGameObj.data.ContainmentQuantum != undefined){
				if(game.SavedGame.SavedGameObj.data.ContainmentQuantum['RedAttached'] == 'Yes'){
					return PlaceGreenBall();
				}else{
					if(game.SavedGame.SavedGameObj.data.RocketRoomCreature != undefined){	
						if(game.SavedGame.SavedGameObj.data.RocketRoomCreature['Pearl'] == "PickedUp"){
							if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'ContainmentQuantum'){
								return "Try adding the red orb from your inventory to the anomaly.";
							}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'ContainmentInterior'){	
								return "Take a closer look at the anomaly.";
							}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'ContainmentCalibrator'){
								return "Take a look at the anomaly in the machine at the center of the chamber.";
							}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'ContainmentConsole'){
								return "Take a look at the anomaly in the machine at the center of the chamber.";
							}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'Containment'){
								return "Something can be done inside the chamber.";
							}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'ContainmentHatch'){
								return "Something can be done inside the chamber.";
							}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'ContainmentControl'){
								return "Something can be done inside the chamber.";
							}else{
								return "Something can be done underground.";
							}
						}else{
							return PlaceRedBallHintBUNDLE00();
						}
					}else{
						return PlaceRedBallHintBUNDLE00();
					}
					
				}
			}else{
				return "No hint at this time.";
			}
			
			
		}
		
		private function PlaceRedBallHintBUNDLE00():String{
			if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'RocketRoomComputerDesk'){
				return "Something can be picked up elsewhere in the room.";
			}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'RocketRoomComputer'){
				return "Something can be picked up elsewhere in the room.";
			}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'RocketRoom'){
				return "The creature has something to give you.";
			}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'RocketRoomCreature'){	
				return "The creature has something to give you.";
			}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'RocketRoomSat'){
				return "Something can be picked up elsewhere in the room.";
			}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'RocketRoomSatStation'){	
				return "Something can be picked up elsewhere in the room.";
			}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'RocketRoomDesk'){
				return "Take a closer look at the nearby creature.";
			}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'RocketRoomBoard'){
				return "Something can be picked up elsewhere in the room.";
			}else{
				return "Something can be picked up in the second floor rocketry research room.";
			}
		}
		
		private function PlaceGreenBall():String{
			if(game.SavedGame.SavedGameObj.data.ContainmentQuantum != undefined){
				if(game.SavedGame.SavedGameObj.data.ContainmentQuantum['GreenAttached'] == 'Yes'){
					return UlamHint();
				}else{
					if(game.SavedGame.SavedGameObj.data.GreenHouseDeepBulb != undefined){
						if(game.SavedGame.SavedGameObj.data.GreenHouseDeepBulb['Pearl'] == 'PickedUp'){
							if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'ContainmentQuantum'){
								return "Try adding the green orb from your inventory to the anomaly.";
							}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'ContainmentInterior'){	
								return "Take a closer look at the anomaly.";
							}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'ContainmentCalibrator'){
								return "Take a look at the anomaly in the machine at the center of the chamber.";
							}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'ContainmentConsole'){
								return "Take a look at the anomaly in the machine at the center of the chamber.";
							}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'Containment'){
								return "Something can be done inside the chamber.";
							}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'ContainmentHatch'){
								return "Something can be done inside the chamber.";
							}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'ContainmentControl'){
								return "Something can be done inside the chamber.";
							}else{
								return "Something can be done underground.";
							}
						}else{
							return PlaceGreenBallHintBUNDLE00();
						}
					}else{
						return PlaceGreenBallHintBUNDLE00();
					}
				}
			}else{
				return "No hint at this time.";
			}
			
			
		}
		
		private function PlaceGreenBallHintBUNDLE00():String{
			if(game.SavedGame.SavedGameObj.data.GreenHouseDeepBulb != undefined){
				if(game.SavedGame.SavedGameObj.data.GreenHouseDeepBulb['BulbState'] == 'Open'){
					if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'GreenHouseDeepShelf'){
						return "Why not try to pick up the green orb floating over the giant botanical bulb creature?";
					}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'GreenHouseDeep'){
						return "Why not try to pick up the green orb floating over the giant botanical bulb creature?";
					}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'GreenHouseDeepBulb'){
						return "Why not try to pick up the floating green orb?";
					}else{
						return "There's an item deep inside the botany laboratory.";
					}
				}else{
					return placeGreenBallHintBUNDLE01();
				}
			}else{
				return placeGreenBallHintBUNDLE01();
			}
		}
		
		private function placeGreenBallHintBUNDLE01():String{
			if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'GreenHouseDeepShelf'){
				return "Take a closer look at the giant botanical creature?";
			}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'GreenHouseDeep'){
				return "Take a closer look at the giant botanical creature?";
			}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'GreenHouseDeepBulb'){
				return "Take a closer look at the bulb.";;
			}else{
				return "There'something to do deep inside the botany laboratory.";
			}
		}
		
		private function UlamHint():String{
			if(game.SavedGame.SavedGameObj.data.ContainmentUlam != undefined){
				if(game.SavedGame.SavedGameObj.data.ContainmentUlam['Solved'] == 'Yes'){
					return FinalHint();	
				}else{
					return UlamHintBUNDLE00();
				}
			}else{
				return UlamHintBUNDLE00();
			}
			
			
		}
		
		private function UlamHintBUNDLE00():String{
			if(game.SavedGame.SavedGameObj.data.ContainmentConsole != undefined){
				if(game.SavedGame.SavedGameObj.data.ContainmentConsole['SpinnerOn'] == 'Yes'){
					if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'ContainmentUlam'){
						return "There's a clue in the second floor rocketry room which can help.";
					}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'ContainmentInterior'){	
						return "Take a closer look at the console on the right-hand side.";
					}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'ContainmentCalibrator'){
						return "Something can be done elsewhere in this chamber.";
					}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'ContainmentConsole'){
						return "Something has happened with the screen on the right.";
					}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'Containment'){
						return "Something can be done inside the chamber.";
					}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'ContainmentHatch'){
						return "Something can be done inside the chamber.";
					}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'ContainmentControl'){
						return "Something can be done inside the chamber.";
						
					}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'RocketRoomComputerDesk'){
						return "The computer has a clue which can help in the basement.";
					}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'RocketRoomComputer'){
						return "The information under 'Regulus Data' can help in the basement.";
					}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'RocketRoom'){
						return "There's a clue in the computer in this room.";
					}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'RocketRoomSat'){
						return "There's a helpful clue elsewhere in this room.";
					}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'RocketRoomSatStation'){	
						return "There's a helpful clue elsewhere in this room.";
					}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'RocketRoomDesk'){
						return "Something can be picked up elsewhere in the room.";
					}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'RocketRoomBoard'){
						return "Take a look at the nearby satellite.";
					}else{
						return "Something can be done underground.";
					}
				}else{
					if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'ContainmentQuantum'){
						return "Something can be accomplished elsewhere in this chamber.";
					}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'ContainmentInterior'){	
						return "Take a closer look at the console on the right hand side.";
					}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'ContainmentCalibrator'){
						return "Something can be done elsewhere in the chamber.";
					}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'ContainmentConsole'){
						return "Try activating the machine again...";
					}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'Containment'){
						return "Something can be done inside the chamber.";
					}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'ContainmentHatch'){
						return "Something can be done inside the chamber.";
					}else if(game.SavedGame.SavedGameObj.data.CurrentRoomClass == 'ContainmentControl'){
						return "Something can be done inside the chamber.";
					}else{
						return "Something can be done underground.";
					}
				}
			}else{
				return "No hint at this time.";
			}
		}
		
		private function FinalHint():String{
			
			return "Hints will not help now.\n" +
				"Your fate is inside the vortex.";
			
		}
		
	}
}

