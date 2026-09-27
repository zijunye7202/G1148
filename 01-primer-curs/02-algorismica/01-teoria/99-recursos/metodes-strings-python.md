# Mètodes de cadenes (`str`) en Python

Font: [documentació oficial de Python 3.14 — String Methods](https://docs.python.org/3.14/library/stdtypes.html#string-methods).

Una cadena és una seqüència de text **immutable**: els mètodes no modifiquen la cadena original, sinó que retornen un valor nou. La sintaxi habitual és `cadena.metode(arguments)`.

```python
text = "  Hola, món!  "
net = text.strip()       # "Hola, món!"
print(text)               # "  Hola, món!  " (no ha canviat)
```

## Cercar i comptar

| Mètode | Què retorna | Exemple |
|---|---|---|
| `s.find(sub)` | Índex de la primera aparició; `-1` si no hi és | `"banana".find("na")` → `2` |
| `s.rfind(sub)` | Índex de l'última aparició; `-1` si no hi és | `"banana".rfind("na")` → `4` |
| `s.index(sub)` / `s.rindex(sub)` | Com `find` / `rfind`, però llança `ValueError` si no hi és | `"abc".index("b")` → `1` |
| `s.count(sub)` | Nombre d'aparicions **no solapades** | `"banana".count("na")` → `2` |
| `s.startswith(prefix)` / `s.endswith(suffix)` | `True` o `False`; admeten una tupla de prefixos/sufixos | `"fitxer.py".endswith(".py")` → `True` |

En els mètodes de cerca i recompte es pot limitar la zona amb `start` i `end`: `"banana".find("na", 3)` → `4`. Per saber simplement si una subcadena hi és, sovint és més llegible `"na" in "banana"`.

## Separar i unir

| Mètode | Què fa | Exemple |
|---|---|---|
| `s.split(sep=None, maxsplit=-1)` | Divideix i retorna una llista. Sense `sep`, separa per qualsevol espai en blanc consecutiu. | `"a  b".split()` → `["a", "b"]` |
| `s.rsplit(sep=None, maxsplit=-1)` | Com `split`, però aplica el límit de divisions des de la dreta. | `"a-b-c".rsplit("-", 1)` → `["a-b", "c"]` |
| `s.splitlines(keepends=False)` | Separa per salts de línia. | `"a\nb".splitlines()` → `["a", "b"]` |
| `s.partition(sep)` / `s.rpartition(sep)` | Retorna una tupla `(abans, separador, després)`; cerca des de l'esquerra / dreta. | `"clau=valor".partition("=")` → `("clau", "=", "valor")` |
| `sep.join(iterable)` | Uneix cadenes intercalant `sep`. | `"-".join(["a", "b"])` → `"a-b"` |

Compte: `split()` i `split(" ")` **no** són iguals: el segon separa per cada espai literal i pot generar elements buits. Els elements de `join` han de ser cadenes.

## Substituir i retallar

| Mètode | Què fa | Exemple |
|---|---|---|
| `s.replace(old, new, count=-1)` | Substitueix aparicions; `count` en limita el nombre. | `"casa".replace("a", "o", 1)` → `"cosa"` |
| `s.strip(chars=None)` | Elimina caràcters dels **dos extrems**; per defecte, espais en blanc. | `"  hola  ".strip()` → `"hola"` |
| `s.lstrip(chars=None)` / `s.rstrip(chars=None)` | Elimina caràcters només a l'esquerra / dreta. | `"...hola...".lstrip(".")` → `"hola..."` |
| `s.removeprefix(prefix)` / `s.removesuffix(suffix)` | Elimina el prefix / sufix exacte, si hi és. | `"fitxer.py".removesuffix(".py")` → `"fitxer"` |

**Trampa habitual:** `strip(".py")` no elimina el sufix literal `.py`: elimina qualsevol combinació dels caràcters `.`, `p` i `y` als extrems. Per a un sufix concret, usa `removesuffix(".py")`.

## Majúscules i minúscules

| Mètode | Resultat | Exemple |
|---|---|---|
| `s.lower()` / `s.upper()` | Tot en minúscules / majúscules. | `"Hola".upper()` → `"HOLA"` |
| `s.capitalize()` | Primera lletra en majúscula i la resta en minúscula. | `"hOLA MÓN".capitalize()` → `"Hola món"` |
| `s.title()` | Inicial de cada paraula en majúscula. | `"hola món".title()` → `"Hola Món"` |
| `s.swapcase()` | Intercanvia majúscules i minúscules. | `"HoLa".swapcase()` → `"hOlA"` |
| `s.casefold()` | Normalització de majúscules més completa que `lower()`, útil per comparar text sense distingir-ne la caixa. | `"Straße".casefold()` → `"strasse"` |

```python
"PYTHON".casefold() == "python".casefold()  # True
```

## Comprovar el contingut (`True` / `False`)

| Mètode | Comprova... | Exemple |
|---|---|---|
| `isalpha()` | Només lletres i cadena no buida. | `"àvia".isalpha()` → `True` |
| `isalnum()` | Només lletres o nombres i cadena no buida. | `"abc123".isalnum()` → `True` |
| `isdecimal()` | Només dígits decimals. | `"123".isdecimal()` → `True` |
| `isdigit()` | Dígits, inclosos alguns que no són decimals (p. ex. superíndexs). | `"²".isdigit()` → `True` |
| `isnumeric()` | Caràcters numèrics en un sentit més ampli. | `"Ⅳ".isnumeric()` → `True` |
| `isascii()` | Tots els caràcters són ASCII. | `"hola".isascii()` → `True` |
| `isspace()` | Només espais en blanc i cadena no buida. | `" \t".isspace()` → `True` |
| `islower()` / `isupper()` | Totes les lletres amb caixa són minúscules / majúscules i n'hi ha almenys una. | `"abc123".islower()` → `True` |
| `istitle()` | Cada paraula té forma de títol. | `"Hola Món".istitle()` → `True` |
| `isidentifier()` | Té la forma d'un identificador de Python. | `"nom_1".isidentifier()` → `True` |
| `isprintable()` | Tots els caràcters són imprimibles. | `"a\n".isprintable()` → `False` |

`isidentifier()` no comprova si el nom és una paraula reservada; per a això cal `keyword.iskeyword()`. Les cadenes buides donen `False` en la majoria d'aquests tests, però `"".isascii()` i `"".isprintable()` donen `True`. Un `True` d'`isdigit()` o `isnumeric()` no garanteix que `int(s)` funcioni.

## Alineació i presentació

| Mètode | Què fa | Exemple |
|---|---|---|
| `s.center(width, fillchar=' ')` | Centra fins a l'amplada indicada. | `"hi".center(6, "-")` → `"--hi--"` |
| `s.ljust(width, fillchar=' ')` / `s.rjust(...)` | Alinea a l'esquerra / dreta. | `"hi".ljust(4, ".")` → `"hi.."` |
| `s.zfill(width)` | Omple amb zeros a l'esquerra; respecta el signe inicial. | `"-42".zfill(5)` → `"-0042"` |
| `s.expandtabs(tabsize=8)` | Substitueix tabuladors per espais fins al següent límit de tabulació. | `"a\tb".expandtabs(4)` → `"a   b"` |
| `s.format(...)` / `s.format_map(mapping)` | Insereix valors als camps `{}` d'una plantilla. | `"Hola, {}".format("Ada")` → `"Hola, Ada"` |

Per a formatacions quotidianes, també són pràctiques les **f-strings**: `nom = "Ada"; f"Hola, {nom}"` → `"Hola, Ada"`.

## Traducció i codificació (més avançat)

- `s.translate(taula)`: substitueix o elimina caràcters segons una taula creada, per exemple, amb `str.maketrans()`.
- `s.encode(encoding='utf-8', errors='strict')`: converteix el text en **bytes**, no en una altra cadena.

```python
taula = str.maketrans({"a": "@", "e": "3"})
"casa i pera".translate(taula)  # "c@s@ i p3r@"
"café".encode("utf-8")         # b'caf\xc3\xa9'
```

## Recordatori ràpid

- `len(s)`, `s[i]`, `s[a:b]` i `sub in s` són operacions útils amb cadenes, **però no són mètodes**.
- Quan busquis un fragment que pot no existir, `find()` retorna `-1`, mentre que `index()` provoca una excepció.
- Reassigna el resultat si vols conservar un canvi: `s = s.strip().lower()`.
