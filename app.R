library(shiny)
library(sf)
library(ggplot2)
# library(plotly)
library(ggiraph)

ui <- fluidPage(
    titlePanel("Cose"),
    sidebarLayout(
        sidebarPanel(
            selectInput("level",
                        "Livello geografico:",
                        choices = c("provincia", "regione"),
                        selected = "regione")
        ),
        mainPanel(
           girafeOutput("mapIta")
        )
    )
)

server <- function(input, output) {

    output$mapIta <- renderGirafe({
        
        if (input$level == "regione") {
            ita_shape <- st_read("data/basi_geo/Limiti_1991_ED50_g/Reg1991_ED50 _g/Reg1991_ED50_g.shp")
            colnames(ita_shape)[colnames(ita_shape) == "REGIONE"] <- "name"
        } else if (input$level == "provincia") {
            ita_shape <- st_read("data/basi_geo/Limiti_1991_ED50_g/Prov1991_ED50_g/Prov1991_ED50_g.shp")
            colnames(ita_shape)[colnames(ita_shape) == "PROVINCIA"] <- "name"
        }
        ita_shape$name <- gsub("'", "&#39", ita_shape$name)
        
        p <- ggplot(ita_shape) +
            geom_sf_interactive(aes(geometry = geometry, 
                                    tooltip = name,
                                    data_id = name),
                                hover_nearest = TRUE) +
            theme_void()
        girafe(ggobj = p)
        # p <- ggplotly(p, tooltip = "text")
        # style(p, hoveron = "fill")
        # style(p, hoverinfo = "text", hoveron = "fill")
        # style(p, text = p$x$data[[1]]$, hoveron = "fill")

    })
}

# Run the application 
shinyApp(ui = ui, server = server)
