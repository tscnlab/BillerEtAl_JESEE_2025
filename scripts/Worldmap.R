# Pakete laden
library(rnaturalearth)
library(sf)

# install.packages("rnaturalearthdata")

# Weltkarte laden
world <- ne_countries(scale = "medium", returnclass = "sf")

# Erweiterte Länder und ihre Farben
countries_colors <- data.frame(
  country = c("Malaysia", "Switzerland"),
  color = pal_jco()(2),
  stringsAsFactors = FALSE
)

# Koordinaten der Hauptstädte (aktualisiert um neue Länder)
capitals_info <- tibble(
  country = c("Malaysia","Switzerland"),
  capital = c("Kuala Lumpur", "Basel"),
  lat = map_dbl(coordinates, 2),
  lon = map_dbl(coordinates, 1),
  color = pal_jco()(2),
  stringsAsFactors = FALSE
)

capitals_info <- 
  capitals_info %>% 
  mutate(
    label = 
      paste0(capital, ", ", country, " (", 
             lat %>% round(1), "° N, ", lon %>% round(1), "° E)")
  )

# Weltkarte mit Farben für spezifische Länder
world$color <- ifelse(world$name %in% countries_colors$country, countries_colors$color[match(world$name, countries_colors$country)], NA)

# Hauptstädte als 'sf' Objekt
capitals <- st_as_sf(capitals_info, coords = c("lon", "lat"), crs = st_crs(world))

# Vorherigen ggplot-Code mit hinzugefügtem geom_label_repel für Beschriftungen
P3 <- 
ggplot() +
  # geom_sf(data = world, fill = NA, color = "black", size = 0.25) + # Ländergrenzen
  geom_sf(data = world, aes(fill = color), color = NA, size = 0.25, alpha = 0.5, show.legend = FALSE) + # Länder färben mit Transparenz
  geom_sf(data = capitals, aes(fill = color), shape = 21, color = "black", size = 3, stroke = 0.2) + # Punkte für Hauptstädte ohne Outline
  geom_sf_label(
    data = capitals,
    aes(label = capitals_info$label, lat = geometry$y, lon = geometry$x, fill = color),
    nudge_y = 12,
    size = 3,
    alpha = 0.75,
    box.padding = 0.35,
    point.padding = 0.5,
    segment.color = 'grey50'
  ) + # Beschriftungen für Hauptstädte
  scale_fill_manual(values = c("#0073C2FF" = "#0073C2FF", "#EFC000FF" = "#EFC000FF")) +
  theme_void() +
  theme(legend.position = "none") # Keine Legende anzeigen
