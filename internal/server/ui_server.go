package server

import (
	"fmt"
	"net/http"
	"time"

	"github.com/labstack/echo/v5"
	"github.com/labstack/echo/v5/middleware"
)

type UIServerConfig struct {
	Addr string
}

func RunUIServer(cfg *UIServerConfig) error {
	e := echo.New()

	e.Use(middleware.RequestLogger())
	e.Use(middleware.Recover())

	e.GET("/", func(c *echo.Context) error {
		msg := fmt.Sprintf("Hello world! The time is %s", time.Now().String())
		return c.JSON(http.StatusOK, map[string]string{"message": msg})
	})

	if err := e.Start(cfg.Addr); err != nil {
		e.Logger.Error("failed to start server", "error", err)
		return err
	}
	return nil
}
