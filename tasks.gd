extends Node
enum traders{
	PRAPOR,
	THERAPIST,
	SKIER,
	PEACEKEEPER,
	MECHANIC,
	RAGMAN,
	JAEGER,
	ITEMS
}

var istradercomplete:= {
	traders.PRAPOR : false,
	traders.THERAPIST : false,
	traders.SKIER : false,
	traders.PEACEKEEPER : false,
	traders.MECHANIC : false,
	traders.RAGMAN : false,
	traders.JAEGER : false,
	traders.ITEMS : false,
}

enum tasks {
	Debut,
	Search,
	Checking,
	Shootout,
	PastDelivery,
	BPDepot,
	Bunker1,
	Bunker2,
	BadRep,
	IceCream,
	Renegades,
	Documents,
	Postman1,
	ShakingupTeller,
	Punisher1,
	Punisher2,
	Punisher3,
	Punisher4,
	Punisher5,
	Punisher6,
	Anesthesia,
	Grenadier,
	TestDrive1,
	Mediator,
	PolikhimHobo,
	Regulated,
	BigCustomer,
	Intimidator,
	EasyJob1,
	EasyJob2,
	Recon,
	Shortage,
	Aq1,
	Aq2,
	Gasan1,
	Gasan2,
	Painkill,
	Pharm,
	DHistory,
	Car,
	Supply,
	HCP1,
	HCP2,
	HCP3,
	HCP4,
	Athlete,
	PClinic,
	HCP5,
	Decontam,
	Wares,
	Coll1,
	Coll2,
	Coll3,
	Postman2,
	Curiosity,
	Crisis,
	Seaside,
	LostContact,
	Trafficking,
	Supplier,
	Extortion,
	Stirrup,
	FlashDrives1,
	GoldenSwag,
	Chem1,
	Chem2,
	Chem3,
	Chem4,
	Vit1,
	Vit2,
	FFtW1,
	FFtW2,
	LL1,
	Setup,
	Informed,
	Chumming,
	Bullshit,
	Flint,
	KindaSabotage,
	RiggedGame,
	SafeCorridor,
	LongRoad,
	MissingCargo,
	Fishing,
	TigrSafari,
	ScrapMetal,
	EagleEye,
	Blueberry1,
	Cult1,
	Cult2,
	SpaTour1,
	SpaTour2,
	SpaTour3,
	SpaTour4,
	SpaTour5,
	SpaTour6,
	SpaTour7,
	Cargo1,
	Cargo2,
	Cargo3,
	WetJob1,
	WetJob2,
	WetJob3,
	WetJob4,
	WetJob5,
	WetJob6,
	TheGuide,
	Samples,
	Terragroup,
	LL2,
	Blueberry2,
	ClassTech,
	RevisReserve,
	Cargo4,
	Insomnia,
	Overpopulation,
	RevisLighthouse,
	Intro,
	GS1,
	GS2,
	GS3,
	GS4,
	GS5,
	GS6,
	GS7,
	GS8,
	GS9,
	GS10,
	GS11,
	GS12,
	GS13,
	GS14,
	GS15,
	GS16,
	GS17,
	GS18,
	GS19,
	GS20,
	GS21,
	GS22,
	Signal1,
	Insider,
	Signal2,
	Scout,
	SurpGoods,
	BackDoor,
	Signal3,
	Signal4,
	Farming1,
	Farming2,
	BadHabit,
	Farming3,
	Farming4,
	PsychoSniper,
	ShooterBorn,
	Fertilizers,
	Import,
	ChemCloset,
	CorpoSecret,
	EnergyCrisis,
	Broadcast1,
	OnlyBusiness,
	MUGA,
	BigSale,
	FuelMatter,
	Inventory,
	Blood1,
	DressedtoKill,
	Gratitude,
	Delivery,
	Scav,
	SalesNight,
	Data1,
	Data2,
	Minibus,
	Sew1,
	Blood2,
	Blood3,
	Sew2,
	KeytoSuccess,
	NoFuss,
	Supervisor,
	Sew3,
	LHinaC1,
	LHinaC2,
	Sew4,
	Charisma,
	Acquaintance,
	Unprotected,
	Thrifty,
	Zhivchik,
	Wounded,
	ToughGuy,
	CourtesyVisit,
	Nostalgia,
	Junkie,
	Eagle,
	Medic,
	Ambulance,
	SecurePerimeter,
	Reserve,
	ForestCleaning,
	Controller,
	EvilWatchman,
	FishingPlace,
	Trophy,
	Justice,
	Sellout,
	WoodsKeeper,
	HuntingTrip,
	FactoryChief,
	Eraser1,
	Eraser2,
	TarkShoot1,
	TarkShoot2,
	TarkShoot3,
	TarkShoot4,
	TarkShoot5,
	TarkShoot6,
	TarkShoot7,
	TarkShoot8,
	FlashDrives2,
	Sadist,
	PestControl,
	Hermit,
	Outcasts,
	StrayDogs,
	Sausage,
	OldFiresteel,
	AntiqueAxe,
	AntiqueBook,
	FireKlean,
	GoldenCock,
	Yeehaw,
	BeardOil,
	GPhone,
	DevilDog,
	Sprats,
	Mustache,
	Kotton,
	LupoBeans,
	Pestily,
	Raven,
	Shroud,
	Veritas,
	Tea,
	Smoke,
	Armband,
	RatCola,
	LootLord,
	WZWallet,
	RatPoison,
	Missam,
	Cassette,
	BakeEzy,
	JohnB,
	GloriousE,
	RedBeard,
	RedPACA,
	Gingy,
	Egg,
	PressPass,
	Axel,
	BEARBuddy,
}
var decision_tasks:= [tasks.BigCustomer, tasks.Chem4, tasks.Curiosity, tasks.SecurePerimeter, tasks.Supply, tasks.KindaSabotage, tasks.WoodsKeeper, tasks.Coll3, tasks.Sadist, tasks.Terragroup]

const taskrequirements:= {
	tasks.Debut : [],
	tasks.Search : [tasks.Debut],
	tasks.Checking : [tasks.Debut],
	tasks.Shootout : [tasks.Checking],
	tasks.PastDelivery : [tasks.Checking],
	tasks.BPDepot : [tasks.PastDelivery],
	tasks.Bunker1 : [tasks.BPDepot],
	tasks.Bunker2 : [tasks.Bunker1],
	tasks.BadRep : [tasks.BPDepot],
	tasks.IceCream : [tasks.BadRep],
	tasks.Renegades : [tasks.Bunker2],
	tasks.Documents : [tasks.Renegades],
	tasks.Postman1 : [tasks.IceCream],
	tasks.ShakingupTeller : [tasks.IceCream],
	tasks.Punisher1 : [tasks.ShakingupTeller],
	tasks.Punisher2 : [tasks.Punisher1],
	tasks.Punisher3 : [tasks.Punisher2],
	tasks.Punisher4 : [tasks.Punisher3],
	tasks.Punisher5 : [tasks.Punisher4],
	tasks.Punisher6 : [tasks.Punisher5],
	tasks.Anesthesia : [tasks.ShakingupTeller],
	tasks.Grenadier : [],
	tasks.TestDrive1 : [tasks.Grenadier],
	tasks.Mediator : [tasks.ShakingupTeller],
	tasks.PolikhimHobo : [tasks.Chem1],
	tasks.Regulated : [tasks.PolikhimHobo],
	tasks.BigCustomer : [tasks.Chem3],
	tasks.Intimidator : [tasks.Punisher6],
	tasks.EasyJob1 : [tasks.Punisher2],
	tasks.EasyJob2 : [tasks.EasyJob1],
	tasks.Recon : [tasks.EasyJob1],
	tasks.Shortage : [],
	tasks.Aq1 : [tasks.Shortage],
	tasks.Aq2 : [tasks.Aq1],
	tasks.Gasan1 : [tasks.Shortage],
	tasks.Gasan2 : [tasks.Gasan1],
	tasks.Painkill : [tasks.Gasan2],
	tasks.Pharm : [tasks.Painkill],
	tasks.DHistory : [tasks.Pharm],
	tasks.Car : [tasks.Pharm],
	tasks.Supply : [tasks.Pharm],
	tasks.HCP1 : [tasks.Pharm],
	tasks.HCP2 : [tasks.HCP1],
	tasks.HCP3 : [tasks.HCP2],
	tasks.HCP4 : [tasks.HCP3],
	tasks.Athlete : [tasks.HCP4],
	tasks.PClinic : [tasks.HCP4],
	tasks.HCP5 : [tasks.HCP4],
	tasks.Decontam : [tasks.PClinic],
	tasks.Wares : [tasks.Pharm],
	tasks.Coll1 : [tasks.Wares],
	tasks.Coll2 : [tasks.Coll1],
	tasks.Coll3 : [tasks.Coll2, tasks.ChemCloset, tasks.RiggedGame],
	tasks.Postman2 : [tasks.Postman1],
	tasks.Curiosity : [tasks.Chem3],
	tasks.Crisis : [],
	tasks.Seaside : [tasks.Pharm],
	tasks.LostContact : [tasks.HCP2],
	tasks.Trafficking : [tasks.LostContact],
	tasks.Supplier : [],
	tasks.Extortion : [tasks.Supplier],
	tasks.Stirrup : [],
	tasks.FlashDrives1 : [tasks.Extortion],
	tasks.GoldenSwag : [tasks.FlashDrives1],
	tasks.Chem1 : [tasks.GoldenSwag],
	tasks.Chem2 : [tasks.Chem1],
	tasks.Chem3 : [tasks.Chem2],
	tasks.Chem4 : [tasks.Chem3],
	tasks.Vit1 : [tasks.Chem2],
	tasks.Vit2 : [tasks.Vit1],
	tasks.FFtW1 : [],
	tasks.FFtW2 : [tasks.FFtW1],
	tasks.LL1 : [tasks.FFtW2],
	tasks.Setup : [tasks.FFtW2],
	tasks.Informed : [tasks.Setup],
	tasks.Chumming : [tasks.Informed],
	tasks.Bullshit : [tasks.Chumming],
	tasks.Flint : [tasks.Chumming],
	tasks.KindaSabotage : [tasks.Pharm],
	tasks.RiggedGame : [tasks.Anesthesia],
	#Safe Corridor and all other decision quests need a custom command.
	tasks.SafeCorridor : [tasks.Chem4, tasks.Curiosity, tasks.BigCustomer],
	tasks.LongRoad : [],
	tasks.MissingCargo : [],
	tasks.Fishing : [tasks.FFtW2],
	tasks.TigrSafari : [tasks.Fishing],
	tasks.ScrapMetal : [tasks.TigrSafari],
	tasks.EagleEye : [tasks.ScrapMetal],
	tasks.Blueberry1 : [tasks.EagleEye],
	tasks.Cult1 : [tasks.Blueberry1],
	tasks.Cult2 : [tasks.Cult2],
	tasks.SpaTour1 : [tasks.Blueberry1],
	tasks.SpaTour2 : [tasks.SpaTour1],
	tasks.SpaTour3 : [tasks.SpaTour2],
	tasks.SpaTour4 : [tasks.SpaTour3],
	tasks.SpaTour5 : [tasks.SpaTour4],
	tasks.SpaTour6 : [tasks.SpaTour5],
	tasks.SpaTour7 : [tasks.SpaTour6],
	tasks.Cargo1 : [tasks.SpaTour7],
	tasks.Cargo2 : [tasks.Cargo1],
	tasks.Cargo3 : [tasks.Cargo2],
	tasks.WetJob1 : [tasks.SpaTour7],
	tasks.WetJob2 : [tasks.WetJob1],
	tasks.WetJob3 : [tasks.WetJob2],
	tasks.WetJob4 : [tasks.WetJob3],
	tasks.WetJob5 : [tasks.WetJob4],
	tasks.WetJob6 : [tasks.WetJob5],
	tasks.TheGuide : [tasks.WetJob6],
	tasks.Samples : [tasks.Fishing],
	tasks.Terragroup : [tasks.Samples, tasks.Coll3,tasks.Sadist],
	tasks.LL2 : [tasks.LL1],
	tasks.Blueberry2 : [tasks.LL2],
	tasks.ClassTech : [tasks.RevisReserve],
	tasks.RevisReserve : [tasks.Blueberry1],
	tasks.Cargo4 : [tasks.Cargo3],
	tasks.Insomnia : [tasks.Cargo4],
	tasks.Overpopulation : [tasks.SpaTour1],
	tasks.RevisLighthouse : [tasks.RevisReserve],
	tasks.Intro : [tasks.GS1],
	tasks.GS1 : [],
	tasks.GS2 : [tasks.GS1],
	tasks.GS3 : [tasks.GS1],
	tasks.GS4 : [tasks.GS2, tasks.GS3],
	tasks.GS5 : [tasks.GS4],
	tasks.GS6 : [tasks.GS5],
	tasks.GS7 : [tasks.GS6],
	tasks.GS8 : [tasks.GS7],
	tasks.GS9 : [tasks.GS8],
	tasks.GS10 : [tasks.GS9],
	tasks.GS11 : [tasks.GS10],
	tasks.GS12 : [tasks.GS11],
	tasks.GS13 : [tasks.GS12],
	tasks.GS14 : [tasks.GS13],
	tasks.GS15 : [tasks.GS14],
	tasks.GS16 : [tasks.GS15],
	tasks.GS17 : [tasks.GS16],
	tasks.GS18 : [tasks.GS17],
	tasks.GS19 : [tasks.GS18],
	tasks.GS20 : [tasks.GS19],
	tasks.GS21 : [tasks.GS20],
	tasks.GS22 : [tasks.GS21],
	tasks.Signal1 : [tasks.GS2],
	tasks.Insider : [tasks.GS3],
	tasks.Signal2 : [tasks.Signal1],
	tasks.Scout : [tasks.Signal2],
	tasks.SurpGoods : [tasks.BackDoor],
	tasks.BackDoor : [tasks.Scout],
	tasks.Signal3 : [tasks.Signal2],
	tasks.Signal4 : [tasks.Signal3],
	tasks.Farming1 : [tasks.GS1],
	tasks.Farming2 : [tasks.Farming1],
	tasks.BadHabit : [tasks.Farming2],
	tasks.Farming3 : [tasks.Farming2],
	tasks.Farming4 : [tasks.Farming3],
	tasks.PsychoSniper : [tasks.WetJob6],
	tasks.ShooterBorn : [tasks.Farming3],
	tasks.Fertilizers : [tasks.Farming4],
	tasks.Import : [tasks.Farming4],
	tasks.ChemCloset : [tasks.Anesthesia, tasks.Coll1],
	tasks.CorpoSecret : [tasks.Farming3],
	tasks.EnergyCrisis : [tasks.Farming4],
	tasks.Broadcast1 : [tasks.Farming2],
	tasks.OnlyBusiness : [],
	tasks.MUGA : [tasks.OnlyBusiness],
	tasks.BigSale : [tasks.OnlyBusiness],
	tasks.FuelMatter : [tasks.Blood1, tasks.BigSale],
	tasks.Inventory : [tasks.FuelMatter],
	tasks.Blood1 : [tasks.MUGA],
	tasks.DressedtoKill : [tasks.Blood1],
	tasks.Gratitude : [tasks.DressedtoKill, tasks.Data2],
	tasks.Delivery : [tasks.Gratitude],
	tasks.Scav : [tasks.Delivery],
	tasks.SalesNight : [tasks.Gratitude],
	tasks.Data1 : [tasks.MUGA, tasks.BigSale],
	tasks.Data2 : [tasks.Data1],
	tasks.Minibus : [tasks.Data2],
	tasks.Sew1 : [tasks.Data2],
	tasks.Blood2 : [tasks.Blood1, tasks.Sew1],
	tasks.Blood3 : [tasks.Blood2],
	tasks.Sew2 : [tasks.Sew1],
	tasks.KeytoSuccess : [tasks.Sew2],
	tasks.NoFuss : [],
	tasks.Supervisor : [tasks.KeytoSuccess, tasks.SalesNight],
	tasks.Sew3 : [tasks.Sew2],
	tasks.LHinaC1 : [tasks.Blood1],
	tasks.LHinaC2 : [tasks.LHinaC2, tasks.Blood3],
	tasks.Sew4 : [tasks.Sew3],
	tasks.Charisma : [tasks.Blood1],
	tasks.Acquaintance : [tasks.Intro],
	tasks.Unprotected : [tasks.Acquaintance],
	tasks.Thrifty : [tasks.Unprotected],
	tasks.Zhivchik : [tasks.Thrifty],
	tasks.Wounded : [tasks.Zhivchik],
	tasks.ToughGuy : [tasks.Wounded],
	tasks.CourtesyVisit : [tasks.ToughGuy],
	tasks.Nostalgia : [tasks.CourtesyVisit],
	tasks.Junkie : [tasks.Medic],
	tasks.Eagle : [tasks.ToughGuy],
	tasks.Medic : [tasks.Eagle],
	tasks.Ambulance : [tasks.FlashDrives2],
	tasks.SecurePerimeter : [tasks.ToughGuy, tasks.TarkShoot3],
	tasks.Reserve : [tasks.Sausage],
	tasks.ForestCleaning : [tasks.SecurePerimeter],
	tasks.Controller : [tasks.SecurePerimeter],
	tasks.EvilWatchman : [tasks.SecurePerimeter],
	tasks.FishingPlace : [tasks.Nostalgia],
	tasks.Trophy : [tasks.SecurePerimeter],
	tasks.Justice : [tasks.SecurePerimeter],
	tasks.Sellout : [tasks.ForestCleaning, tasks.SalesNight],
	#Results from either Supply Plans or Kind of Sabotage and Secured Perimeter
	tasks.WoodsKeeper : [tasks.SecurePerimeter, tasks.Supply, tasks.KindaSabotage],
	tasks.HuntingTrip : [tasks.WoodsKeeper],
	tasks.FactoryChief : [tasks.ForestCleaning, tasks.Scout],
	tasks.Eraser1 : [tasks.PestControl],
	tasks.Eraser2 : [tasks.Eraser1],
	tasks.TarkShoot1 : [tasks.Acquaintance],
	tasks.TarkShoot2 : [tasks.TarkShoot1],
	tasks.TarkShoot3 : [tasks.TarkShoot2],
	tasks.TarkShoot4 : [tasks.TarkShoot3],
	tasks.TarkShoot5 : [tasks.TarkShoot4],
	tasks.TarkShoot6 : [tasks.TarkShoot5],
	tasks.TarkShoot7 : [tasks.TarkShoot6],
	tasks.TarkShoot8 : [tasks.TarkShoot7],
	tasks.FlashDrives2 : [tasks.Acquaintance, tasks.FlashDrives1],
	tasks.Sadist : [tasks.Coll2, tasks.RiggedGame, tasks.ChemCloset],
	tasks.PestControl : [tasks.Reserve],
	tasks.Hermit : [tasks.ToughGuy],
	tasks.Outcasts : [tasks.ForestCleaning],
	tasks.StrayDogs : [tasks.Trophy, tasks.Sellout, tasks.WoodsKeeper],
	tasks.Sausage : [tasks.Thrifty],
	tasks.OldFiresteel : [],
	tasks.AntiqueAxe : [],
	tasks.AntiqueBook : [],
	tasks.FireKlean : [],
	tasks.GoldenCock : [],
	tasks.Yeehaw : [],
	tasks.BeardOil : [],
	tasks.GPhone : [],
	tasks.DevilDog : [],
	tasks.Sprats : [],
	tasks.Mustache : [],
	tasks.Kotton : [],
	tasks.LupoBeans : [],
	tasks.Pestily : [],
	tasks.Raven : [],
	tasks.Shroud : [],
	tasks.Veritas : [],
	tasks.Tea : [],
	tasks.Smoke : [],
	tasks.Armband : [],
	tasks.RatCola : [],
	tasks.LootLord : [],
	tasks.WZWallet : [],
	tasks.RatPoison : [],
	tasks.Missam : [],
	tasks.BakeEzy : [],
	tasks.JohnB : [],
	tasks.GloriousE : [],
	tasks.RedBeard : [],
	tasks.RedPACA : [],
	tasks.Gingy : [],
	tasks.Egg : [],
	tasks.PressPass : [],
	tasks.Axel : [],
	tasks.BEARBuddy : []
}