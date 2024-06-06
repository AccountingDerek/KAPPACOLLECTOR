extends Node
@export var task_array: Array[TaskResource]
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
	ShootingCans,
	Debut,
	Luxurious,
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
	FirstinLine,
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
	BurningRubber,
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
	SavingtheMole,
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
