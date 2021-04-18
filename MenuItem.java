import java.util.ArrayList;

public class MenuItem {
    int price;
    String identifier;
}

private class Drink extends MenuItem {
    enum Base {
	COFFEE,
	TEA,
	ITALIAN_SODA
    }

    enum Fixins {
	EXPRESSO_SHOT,
	VANILLA_SYRUP,
	STEAMED_MILK,
	NONE
    }
}

private class Food extends MenuItem {
    enum Foods {
	CROISSANT,
	CROISSANT_WITH_HAM,
	DANISH,
	MUFFIN
    }
}
