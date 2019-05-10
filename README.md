# ereg_test

A little tool to visualize the difference in Haxe's `EReg` class.

## Installation & Setup

Download or clone this repo. Using `lix` run `lix download` to install missing libs.

Then run `haxe build.hxml && haxe collect.hxml`. Checkout the generated `results.html` in the `bin` directory.

## Current Output

<table>
    <thead>
        <tr>
            <th></th>
            <th>expected</th>
            <th>python/re</th>
            <th>php/PCRE</th>
            <th>js/RegExp</th>
            <th>neko/PCRE</th>
            <th>hl/PCRE</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>testEndOfLine</td>
            <td>true</td>
            <td data-matched="true">👍</td>
            <td data-matched="true">👍</td>
            <td data-matched="true">👍</td>
            <td data-matched="true">👍</td>
            <td data-matched="true">👍</td>
        </tr>
        <tr>
            <td>testEndOfLine_withCR</td>
            <td>false</td>
            <td data-matched="true">👍</td>
            <td data-matched="true">👍</td>
            <td data-matched="true">👍</td>
            <td data-matched="true">👍</td>
            <td data-matched="true">👍</td>
        </tr>
        <tr>
            <td>testEndOfLine_withCRLF</td>
            <td>false</td>
            <td data-matched="true">👍</td>
            <td data-matched="true">👍</td>
            <td data-matched="true">👍</td>
            <td data-matched="true">👍</td>
            <td data-matched="true">👍</td>
        </tr>
        <tr>
            <td>testEndOfLine_withCRLF_multiline</td>
            <td>true</td>
            <td data-matched="false">❌</td>
            <td data-matched="false">❌</td>
            <td data-matched="true">👍</td>
            <td data-matched="false">❌</td>
            <td data-matched="false">❌</td>
        </tr>
        <tr>
            <td>testEndOfLine_withCR_multiline</td>
            <td>false</td>
            <td data-matched="true">👍</td>
            <td data-matched="true">👍</td>
            <td data-matched="false">❌abc</td>
            <td data-matched="true">👍</td>
            <td data-matched="true">👍</td>
        </tr>
        <tr>
            <td>testEndOfLine_withLF</td>
            <td>true</td>
            <td data-matched="true">👍</td>
            <td data-matched="true">👍</td>
            <td data-matched="false">❌</td>
            <td data-matched="true">👍</td>
            <td data-matched="true">👍</td>
        </tr>
        <tr>
            <td>testEndOfLine_withLF_multiline</td>
            <td>true</td>
            <td data-matched="true">👍</td>
            <td data-matched="true">👍</td>
            <td data-matched="true">👍</td>
            <td data-matched="true">👍</td>
            <td data-matched="true">👍</td>
        </tr>
        <tr>
            <td>testStartEndOfLine_withCRLF</td>
            <td>false</td>
            <td data-matched="true">👍</td>
            <td data-matched="true">👍</td>
            <td data-matched="true">👍</td>
            <td data-matched="true">👍</td>
            <td data-matched="true">👍</td>
        </tr>
        <tr>
            <td>testStartEndOfLine_withCRLF_multiline</td>
            <td>false</td>
            <td data-matched="true">👍</td>
            <td data-matched="true">👍</td>
            <td data-matched="false">❌abc</td>
            <td data-matched="true">👍</td>
            <td data-matched="true">👍</td>
        </tr>
        <tr>
            <td>testStartEndOfLine_withLF</td>
            <td>false</td>
            <td data-matched="true">👍</td>
            <td data-matched="true">👍</td>
            <td data-matched="true">👍</td>
            <td data-matched="true">👍</td>
            <td data-matched="true">👍</td>
        </tr>
        <tr>
            <td>testStartEndOfLine_withLF_multiline</td>
            <td>true</td>
            <td data-matched="true">👍</td>
            <td data-matched="true">👍</td>
            <td data-matched="true">👍</td>
            <td data-matched="true">👍</td>
            <td data-matched="true">👍</td>
        </tr>
        <tr>
            <td>testStartEndOfLine_withMixedCRLF_multiline</td>
            <td>false</td>
            <td data-matched="true">👍</td>
            <td data-matched="true">👍</td>
            <td data-matched="false">❌abc</td>
            <td data-matched="true">👍</td>
            <td data-matched="true">👍</td>
        </tr>
        <tr>
            <td>testStartOfLine</td>
            <td>true</td>
            <td data-matched="true">👍</td>
            <td data-matched="true">👍</td>
            <td data-matched="true">👍</td>
            <td data-matched="true">👍</td>
            <td data-matched="true">👍</td>
        </tr>
        <tr>
            <td>testStartOfLine_withCR</td>
            <td>false</td>
            <td data-matched="true">👍</td>
            <td data-matched="true">👍</td>
            <td data-matched="true">👍</td>
            <td data-matched="true">👍</td>
            <td data-matched="true">👍</td>
        </tr>
        <tr>
            <td>testStartOfLine_withCRLF</td>
            <td>false</td>
            <td data-matched="true">👍</td>
            <td data-matched="true">👍</td>
            <td data-matched="true">👍</td>
            <td data-matched="true">👍</td>
            <td data-matched="true">👍</td>
        </tr>
        <tr>
            <td>testStartOfLine_withCRLF_multiline</td>
            <td>true</td>
            <td data-matched="true">👍</td>
            <td data-matched="true">👍</td>
            <td data-matched="true">👍</td>
            <td data-matched="true">👍</td>
            <td data-matched="true">👍</td>
        </tr>
        <tr>
            <td>testStartOfLine_withCR_multiline</td>
            <td>false</td>
            <td data-matched="true">👍</td>
            <td data-matched="true">👍</td>
            <td data-matched="false">❌abc</td>
            <td data-matched="true">👍</td>
            <td data-matched="true">👍</td>
        </tr>
        <tr>
            <td>testStartOfLine_withLF</td>
            <td>false</td>
            <td data-matched="true">👍</td>
            <td data-matched="true">👍</td>
            <td data-matched="true">👍</td>
            <td data-matched="true">👍</td>
            <td data-matched="true">👍</td>
        </tr>
        <tr>
            <td>testStartOfLine_withLF_multiline</td>
            <td>true</td>
            <td data-matched="true">👍</td>
            <td data-matched="true">👍</td>
            <td data-matched="true">👍</td>
            <td data-matched="true">👍</td>
            <td data-matched="true">👍</td>
        </tr>
    </tbody>
</table>