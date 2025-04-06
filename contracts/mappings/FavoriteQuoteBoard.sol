// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

error FavoriteQuoteBoard__AlreadySetQuote();
error FavoriteQuoteBoard__EmptyQuote();

contract FavoriteQuoteBoard {
    /* State Variables */
    mapping (address => string) private s_quotes;
    mapping (address => bool) private s_hasSetQuote;

    /* Functions */
    function setQuote (string memory _quote) public {
        if (s_hasSetQuote[msg.sender]) revert FavoriteQuoteBoard__AlreadySetQuote();
        if (bytes(_quote).length == 0) revert FavoriteQuoteBoard__EmptyQuote();

        s_quotes[msg.sender] = _quote;
        s_hasSetQuote[msg.sender] = true;
    }

    /* Getters */
    function getQuote(address _user) public view returns (string memory) {
        return s_quotes[_user];
    }

    function hasSetQuote(address _user) public view returns (bool) {
        return s_hasSetQuote[_user];
    }
}
