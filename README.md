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
            <td title="testEndOfLine_withCRLF">~/abc$/u.match('abc\r\n')</td>
            <td>false</td>
            <td data-matched="true">👍</td>
            <td data-matched="true">👍</td>
            <td data-matched="true">👍</td>
            <td data-matched="true">👍</td>
            <td data-matched="true">👍</td>
        </tr>
        <tr>
            <td title="testEndOfLine_withCR">~/abc$/u.match('abc\r')</td>
            <td>false</td>
            <td data-matched="true">👍</td>
            <td data-matched="true">👍</td>
            <td data-matched="true">👍</td>
            <td data-matched="true">👍</td>
            <td data-matched="true">👍</td>
        </tr>
        <tr>
            <td title="testEndOfLine_withLF">~/abc$/u.match('abc\n')</td>
            <td>true</td>
            <td title="abc" data-matched="true">👍</td>
            <td title="abc" data-matched="true">👍</td>
            <td data-matched="false">❌</td>
            <td title="abc" data-matched="true">👍</td>
            <td title="abc" data-matched="true">👍</td>
        </tr>
        <tr>
            <td title="testEndOfLine">~/abc$/u.match('abc')</td>
            <td>true</td>
            <td title="abc" data-matched="true">👍</td>
            <td title="abc" data-matched="true">👍</td>
            <td title="abc" data-matched="true">👍</td>
            <td title="abc" data-matched="true">👍</td>
            <td title="abc" data-matched="true">👍</td>
        </tr>
        <tr>
            <td title="testEndOfLine_withCRLF_multiline">~/abc$/mu.match('abc\r\n')</td>
            <td>true</td>
            <td data-matched="false">❌</td>
            <td data-matched="false">❌</td>
            <td title="abc" data-matched="true">👍</td>
            <td data-matched="false">❌</td>
            <td data-matched="false">❌</td>
        </tr>
        <tr>
            <td title="testEndOfLine_withCR_multiline">~/abc$/mu.match('abc\r')</td>
            <td>false</td>
            <td data-matched="true">👍</td>
            <td data-matched="true">👍</td>
            <td title="abc" data-matched="false">❌abc</td>
            <td data-matched="true">👍</td>
            <td data-matched="true">👍</td>
        </tr>
        <tr>
            <td title="testEndOfLine_withLF_multiline">~/abc$/mu.match('abc\n')</td>
            <td>true</td>
            <td title="abc" data-matched="true">👍</td>
            <td title="abc" data-matched="true">👍</td>
            <td title="abc" data-matched="true">👍</td>
            <td title="abc" data-matched="true">👍</td>
            <td title="abc" data-matched="true">👍</td>
        </tr>
        <tr>
            <td title="testStartOfLine">~/^abc/u.match('abc')</td>
            <td>true</td>
            <td title="abc" data-matched="true">👍</td>
            <td title="abc" data-matched="true">👍</td>
            <td title="abc" data-matched="true">👍</td>
            <td title="abc" data-matched="true">👍</td>
            <td title="abc" data-matched="true">👍</td>
        </tr>
        <tr>
            <td title="testStartOfLine_withCR">~/^abc/u.match('\rabc')</td>
            <td>false</td>
            <td data-matched="true">👍</td>
            <td data-matched="true">👍</td>
            <td data-matched="true">👍</td>
            <td data-matched="true">👍</td>
            <td data-matched="true">👍</td>
        </tr>
        <tr>
            <td title="testStartOfLine_withCRLF">~/^abc/u.match('\r\nabc')</td>
            <td>false</td>
            <td data-matched="true">👍</td>
            <td data-matched="true">👍</td>
            <td data-matched="true">👍</td>
            <td data-matched="true">👍</td>
            <td data-matched="true">👍</td>
        </tr>
        <tr>
            <td title="testStartOfLine_withLF">~/^abc/u.match('\nabc')</td>
            <td>false</td>
            <td data-matched="true">👍</td>
            <td data-matched="true">👍</td>
            <td data-matched="true">👍</td>
            <td data-matched="true">👍</td>
            <td data-matched="true">👍</td>
        </tr>
        <tr>
            <td title="testStartOfLine_withCR_multiline">~/^abc/mu.match('\rabc')</td>
            <td>false</td>
            <td data-matched="true">👍</td>
            <td data-matched="true">👍</td>
            <td title="abc" data-matched="false">❌abc</td>
            <td data-matched="true">👍</td>
            <td data-matched="true">👍</td>
        </tr>
        <tr>
            <td title="testStartOfLine_withCRLF_multiline">~/^abc/mu.match('\r\nabc')</td>
            <td>true</td>
            <td title="abc" data-matched="true">👍</td>
            <td title="abc" data-matched="true">👍</td>
            <td title="abc" data-matched="true">👍</td>
            <td title="abc" data-matched="true">👍</td>
            <td title="abc" data-matched="true">👍</td>
        </tr>
        <tr>
            <td title="testStartOfLine_withLF_multiline">~/^abc/mu.match('\nabc')</td>
            <td>true</td>
            <td title="abc" data-matched="true">👍</td>
            <td title="abc" data-matched="true">👍</td>
            <td title="abc" data-matched="true">👍</td>
            <td title="abc" data-matched="true">👍</td>
            <td title="abc" data-matched="true">👍</td>
        </tr>
        <tr>
            <td title="testStartEndOfLine_withCRLF">~/^abc$/u.match('foo\r\nabc\r\n')</td>
            <td>false</td>
            <td data-matched="true">👍</td>
            <td data-matched="true">👍</td>
            <td data-matched="true">👍</td>
            <td data-matched="true">👍</td>
            <td data-matched="true">👍</td>
        </tr>
        <tr>
            <td title="testStartEndOfLine_withLF">~/^abc$/u.match('foo\nabc\n')</td>
            <td>false</td>
            <td data-matched="true">👍</td>
            <td data-matched="true">👍</td>
            <td data-matched="true">👍</td>
            <td data-matched="true">👍</td>
            <td data-matched="true">👍</td>
        </tr>
        <tr>
            <td title="testStartEndOfLine_withCRLF_multiline">~/^abc$/mu.match('foo\r\nabc\r\n')</td>
            <td>false</td>
            <td data-matched="true">👍</td>
            <td data-matched="true">👍</td>
            <td title="abc" data-matched="false">❌abc</td>
            <td data-matched="true">👍</td>
            <td data-matched="true">👍</td>
        </tr>
        <tr>
            <td title="testStartEndOfLine_withLF_multiline">~/^abc$/mu.match('foo\nabc\n')</td>
            <td>true</td>
            <td title="abc" data-matched="true">👍</td>
            <td title="abc" data-matched="true">👍</td>
            <td title="abc" data-matched="true">👍</td>
            <td title="abc" data-matched="true">👍</td>
            <td title="abc" data-matched="true">👍</td>
        </tr>
        <tr>
            <td title="testStartEndOfLine_withMixedCRLF_multiline">~/^abc$/mu.match('\n\rfoo\r\n\rabc\r\n')</td>
            <td>false</td>
            <td data-matched="true">👍</td>
            <td data-matched="true">👍</td>
            <td title="abc" data-matched="false">❌abc</td>
            <td data-matched="true">👍</td>
            <td data-matched="true">👍</td>
        </tr>
        <tr>
            <td title="testStartEndOfLine_newlineCharacterSet_PCRE">new EReg('^\Rabc\R$', 'mu').match('\n\rfoo\r\n\rabc\r\n')</td>
            <td>true</td>
            <td title="Not tested for this platform">⛔</td>
            <td title="\rabc\r\n" data-matched="true">👍</td>
            <td title="Not tested for this platform">⛔</td>
            <td title="\rabc\r\n" data-matched="true">👍</td>
            <td title="\rabc\r\n" data-matched="true">👍</td>
        </tr>
        <tr>
            <td title="testStartEndOfLine_newlineGroupSet_NonPCRE">new EReg('^(\r\n|\n|\r)abc(\r\n|\n|\r)$', 'mu').match('\n\rfoo\r\n\rabc\r\n')</td>
            <td>true</td>
            <td title="\rabc\r\n" data-matched="true">👍</td>
            <td title="Not tested for this platform">⛔</td>
            <td title="\rabc\r\n" data-matched="true">👍</td>
            <td title="Not tested for this platform">⛔</td>
            <td title="Not tested for this platform">⛔</td>
        </tr>
    </tbody>
</table>