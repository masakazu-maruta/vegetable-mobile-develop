package main

import (
	"net/http"

	"github.com/labstack/echo/v4"
	"github.com/labstack/echo/v4/middleware"
)

func main() {
	e := echo.New()
	e.Use(middleware.CORS())
	e.GET("/", func(c echo.Context) error {
		return c.String(http.StatusOK, "Golang × ReactNative!")
	})
	e.Logger.Fatal(e.Start(":8080"))
}
