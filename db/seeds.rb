Wine.where(name: 'Xavier').first_or_create!(year:2010, winery:'Roman Vinyard', country:'Italy', varietal:'Chardonnay')

Wine.where(name: 'Cava').first_or_create!(year:2013, winery:'Spanish Vinyard', country:'Spain', varietal:'Sparkling')

Wine.where(name: 'Dancing Bear').first_or_create!(year:2011, winery:'Jacob Creek', country:'USA', varietal:'Merlot')