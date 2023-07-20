package db

import "testing"

func TestAccount(t *testing.T) {
	arg := CreateAccountParams{
		Owner:    "John",
		Balance:  100,
		Currency: "ZAR",
	}
}
