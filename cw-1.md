# Ćwiczenia praktyczne - Neovim dla Rust

Plik zawiera serię ćwiczeń do opanowania efektywnej pracy w Neovim.
Zalecana kolejność: najpierw przećwicz krótkie ćwiczenia (Część 1), potem przejdź do scenariuszy (Część 2).

---

# CZĘŚĆ 1: Krótkie ćwiczenia (dryl codzienny)

## 1.1 Nawigacja podstawowa

Otwórz dowolny plik z kodem i przećwicz:

| Ćwiczenie | Komenda | Cel |
|-----------|---------|-----|
| Ruch w linii | `h` `j` `k` `l` | Poruszaj się bez strzałek |
| Po słowach | `w` `b` `e` | Skacz po słowach (w-następne, b-poprzednie, e-koniec) |
| Po SŁOWACH | `W` `B` `E` | Jak wyżej, ale ignoruje interpunkcję |
| Początek/koniec linii | `0` `$` | Skocz na początek/koniec linii |
| Pierwszy znak | `^` | Skocz do pierwszego nie-białego znaku |
| Początek/koniec pliku | `gg` `G` | Skocz na górę/dół pliku |
| Do linii N | `42G` lub `:42` | Skocz do linii 42 |
| Po paragrafach | `{` `}` | Skacz między pustymi liniami |
| Pół strony | `Ctrl+d` `Ctrl+u` | Przewiń pół strony w dół/górę |
| Centruj widok | `zz` `zt` `zb` | Wycentruj linię / góra / dół ekranu |

**Wyzwanie:** Poruszaj się po pliku bez użycia strzałek przez 5 minut.

---

## 1.2 Wyszukiwanie

```rust
fn calculate_sum(numbers: &[i32]) -> i32 {
    let mut sum = 0;
    for num in numbers {
        sum += num;
    }
    sum
}

fn calculate_product(numbers: &[i32]) -> i32 {
    let mut product = 1;
    for num in numbers {
        product *= num;
    }
    product
}
```

| Ćwiczenie | Komenda | Cel |
|-----------|---------|-----|
| Szukaj w przód | `/calculate` + `Enter` | Znajdź "calculate" |
| Następne wystąpienie | `n` | Skocz do następnego |
| Poprzednie wystąpienie | `N` | Skocz do poprzedniego |
| Szukaj w tył | `?sum` + `Enter` | Szukaj wstecz |
| Słowo pod kursorem | `*` | Szukaj słowa pod kursorem w przód |
| Słowo pod kursorem (wstecz) | `#` | Szukaj słowa pod kursorem w tył |
| Znak w linii | `fn` | Skocz do następnego 'n' w linii |
| Znak w linii (wstecz) | `Fn` | Skocz do poprzedniego 'n' |
| Do znaku | `t;` | Skocz tuż przed ';' |
| Powtórz f/t | `;` `,` | Powtórz ostatnie f/t w przód/tył |

**Wyzwanie:** Znajdź wszystkie wystąpienia `sum` używając `*` i `n`.

---

## 1.3 Find & Replace

```rust
let user_name = "John";
let user_age = 25;
let user_email = "john@example.com";
println!("User: {}, Age: {}", user_name, user_age);
```

| Ćwiczenie | Komenda | Cel |
|-----------|---------|-----|
| Zamień w linii | `:s/user/customer/` | Zamień pierwsze wystąpienie |
| Wszystkie w linii | `:s/user/customer/g` | Zamień wszystkie w linii |
| W całym pliku | `:%s/user/customer/g` | Zamień w całym pliku |
| Z potwierdzeniem | `:%s/user/customer/gc` | Pytaj o każdą zamianę (y/n/a/q) |
| W zaznaczeniu | `:'<,'>s/old/new/g` | Zaznacz V, potem komenda |
| Case insensitive | `:%s/USER/customer/gi` | Ignoruj wielkość liter |
| Całe słowo | `:%s/\<user\>/customer/g` | Tylko całe słowo "user" |

**Wyzwanie:** Zamień wszystkie `user_` na `client_` z potwierdzeniem.

---

## 1.4 Operatory + Motion

Vim działa na zasadzie: `operator` + `motion/textobject`

```rust
fn process_data(input: String) -> Result<String, Error> {
    let trimmed = input.trim();
    let result = format!("Processed: {}", trimmed);
    Ok(result)
}
```

| Ćwiczenie | Komenda | Cel |
|-----------|---------|-----|
| Usuń słowo | `dw` | Usuń od kursora do końca słowa |
| Usuń całe słowo | `diw` | Usuń słowo (inner word) |
| Usuń słowo + spację | `daw` | Usuń słowo ze spacją (a word) |
| Usuń do końca linii | `d$` lub `D` | Usuń do końca linii |
| Usuń linię | `dd` | Usuń całą linię |
| Zmień słowo | `ciw` | Usuń słowo i wejdź w insert mode |
| Zmień w cudzysłowie | `ci"` | Zmień tekst w "" |
| Zmień w nawiasach | `ci(` | Zmień tekst w () |
| Kopiuj linię | `yy` | Skopiuj całą linię |
| Kopiuj słowo | `yiw` | Skopiuj słowo |
| Kopiuj w nawiasach | `yi(` | Skopiuj zawartość () |
| Wklej | `p` / `P` | Wklej po/przed kursorem |

**Wyzwanie:** Zmień `"Processed: {}"` na `"Output: {}"` używając `ci"`.

---

## 1.5 Makra i rejestry

```rust
let a = 1;
let b = 2;
let c = 3;
let d = 4;
let e = 5;
```

Chcemy zmienić na: `let a: i32 = 1;`

| Ćwiczenie | Komenda | Cel |
|-----------|---------|-----|
| Nagraj makro | `qa` | Rozpocznij nagrywanie do rejestru 'a' |
| Zakończ nagrywanie | `q` | Zatrzymaj nagrywanie |
| Odtwórz makro | `@a` | Odtwórz makro 'a' |
| Powtórz ostatnie makro | `@@` | Odtwórz poprzednie makro |
| Odtwórz N razy | `5@a` | Odtwórz makro 5 razy |
| Kopiuj do rejestru | `"ay` | Kopiuj do rejestru 'a' |
| Wklej z rejestru | `"ap` | Wklej z rejestru 'a' |
| Schowek systemowy | `"+y` / `"+p` | Kopiuj/wklej do/z systemu |
| Zobacz rejestry | `:reg` | Pokaż zawartość rejestrów |

**Wyzwanie - nagraj makro:**
1. `qa` - zacznij nagrywanie
2. `f=` - skocz do =
3. `i: i32` + `Esc` - wstaw typ
4. `j0` - następna linia, początek
5. `q` - zakończ nagrywanie
6. `4@a` - zastosuj do pozostałych linii

---

## 1.6 Text Objects (mini.ai)

```rust
struct User {
    name: String,
    age: u32,
}

impl User {
    fn new(name: String, age: u32) -> Self {
        Self { name, age }
    }

    fn greet(&self) -> String {
        if self.age >= 18 {
            format!("Hello, adult {}!", self.name)
        } else {
            format!("Hi, young {}!", self.name)
        }
    }
}
```

| Ćwiczenie | Komenda | Cel |
|-----------|---------|-----|
| Zaznacz funkcję (wewnątrz) | `vif` | Zaznacz ciało funkcji |
| Zaznacz funkcję (cała) | `vaf` | Zaznacz całą funkcję z sygnaturą |
| Usuń funkcję | `daf` | Usuń całą funkcję |
| Zaznacz struct/impl | `vac` | Zaznacz całą klasę/struct/impl |
| Zaznacz parametr | `via` | Zaznacz argument funkcji |
| Usuń parametr | `daa` | Usuń argument z przecinkiem |
| Zaznacz pętlę | `vao` | Zaznacz całą pętlę |
| Zaznacz if | `vai` | Zaznacz cały blok if |
| Skocz do funkcji | `]m` / `[m` | Następna/poprzednia funkcja |
| Skocz do klasy | `]]` / `[[` | Następna/poprzednia klasa |

**Wyzwanie:** Ustaw kursor w funkcji `greet`, wciśnij `daf` - usuń całą funkcję.

---

## 1.7 Surround (mini.surround)

```rust
let name = John;
let message = Hello World;
let data = vec( 1, 2, 3 );
```

| Ćwiczenie | Komenda | Cel |
|-----------|---------|-----|
| Dodaj "" wokół słowa | `saiw"` | Otocz słowo cudzysłowem |
| Dodaj () wokół słowa | `saiw)` | Otocz słowo nawiasami |
| Dodaj "" wokół 2 słów | `sa2aw"` | Otocz 2 słowa cudzysłowem |
| Usuń cudzysłowy | `sd"` | Usuń otaczające "" |
| Usuń nawiasy | `sd)` lub `sd(` | Usuń otaczające () |
| Zamień "" na '' | `sr"'` | Zamień cudzysłowy |
| Zamień () na [] | `sr)]` | Zamień nawiasy |
| Zamień [] na () | `sr](` | Zamień nawiasy |
| Dodaj w visual mode | `v` + zaznacz + `sa"` | Otocz zaznaczenie |

**Wyzwanie:** Napraw powyższy kod:
1. Na `John` wciśnij `saiw"` → `"John"`
2. Na `Hello` wciśnij `sa2aw"` → `"Hello World"`
3. Na `vec` zamień `[` na `!` + `[`: ustaw kursor na `[`, wciśnij `sr[)` → `vec(1, 2, 3)`, potem napraw na `vec![...]`

---

## 1.8 LSP - Nawigacja

| Ćwiczenie | Komenda | Cel |
|-----------|---------|-----|
| Dokumentacja | `K` | Pokaż dokumentację pod kursorem |
| Idź do definicji | `gd` | Skocz do definicji funkcji/typu |
| Idź do deklaracji | `gD` | Skocz do deklaracji |
| Znajdź użycia | `gr` | Pokaż wszystkie miejsca użycia |
| Implementacje | `gI` | Pokaż implementacje trait/interface |
| Definicja typu | `gy` | Skocz do definicji typu zmiennej |

**Wyzwanie:** W projekcie Rust:
1. Ustaw kursor na nazwie funkcji
2. `K` - przeczytaj dokumentację
3. `gr` - zobacz gdzie jest używana
4. `gd` - skocz do definicji

---

## 1.9 LSP - Diagnostyka i poprawki

| Ćwiczenie | Komenda | Cel |
|-----------|---------|-----|
| Pokaż błąd | `ge` | Wyświetl błąd w okienku float |
| Wyjaśnij błąd (Rust) | `gE` | Szczegółowe wyjaśnienie błędu |
| Następny błąd | `]d` | Skocz do następnego błędu |
| Poprzedni błąd | `[d` | Skocz do poprzedniego błędu |
| Menu akcji | `ga` | Pokaż dostępne akcje kodu |
| Szybka poprawka | `gf` | Zastosuj sugerowaną poprawkę |
| Napraw wszystko | `gF` | Napraw wszystkie błędy w pliku |

**Wyzwanie:** Znajdź błąd w kodzie, przeczytaj wyjaśnienie (`gE`), zastosuj poprawkę (`gf`).

---

## 1.10 Picker (snacks.nvim)

| Ćwiczenie | Komenda | Cel |
|-----------|---------|-----|
| Szukaj pliku | `<Space>ff` | Znajdź plik po nazwie |
| Grep w treści | `<Space>fg` | Szukaj tekstu w plikach |
| Ostatnie pliki | `<Space>fr` | Lista ostatnio otwartych |
| Bufory | `<Space>fb` | Lista otwartych buforów |
| Symbole w pliku | `<Space>fs` | Lista funkcji/typów w pliku |
| Symbole w projekcie | `<Space>fS` | Lista symboli w całym projekcie |
| Smart search | `<Space><Space>` | Inteligentne wyszukiwanie |
| Projekty | `<Space>fp` | Lista projektów |
| Pomoc | `<Space>fh` | Szukaj w dokumentacji |
| Skróty | `<Space>fk` | Lista skrótów klawiszowych |

**Wyzwanie:** Znajdź wszystkie pliki zawierające słowo "config" używając `<Space>fg`.

---

## 1.11 Git

| Ćwiczenie | Komenda | Cel |
|-----------|---------|-----|
| LazyGit | `<Space>gg` | Otwórz pełny UI Git |
| Następny hunk | `]c` | Skocz do następnej zmiany |
| Poprzedni hunk | `[c` | Skocz do poprzedniej zmiany |
| Stage hunk | `<Space>ghs` | Dodaj zmianę do staging |
| Reset hunk | `<Space>ghr` | Cofnij zmianę |
| Preview hunk | `<Space>ghp` | Podgląd zmiany |
| Blame line | `<Space>ghb` | Kto zmienił tę linię |
| Diff this | `<Space>ghd` | Pokaż diff dla pliku |
| Git status | `<Space>gs` | Lista zmienionych plików |
| Historia | `<Space>gl` | Historia commitów |

**Wyzwanie:** Zmodyfikuj plik, przejrzyj zmiany (`]c`), dodaj do staging (`<Space>ghs`).

---

## 1.12 Cargo/Rust

| Ćwiczenie | Komenda | Cel |
|-----------|---------|-----|
| Build | `<Space>cb` | Zbuduj projekt |
| Run | `<Space>cr` | Uruchom projekt |
| Test | `<Space>ct` | Uruchom testy |
| Wybierz test | `<Space>cT` | Wybierz konkretny test |
| Check | `<Space>ck` | Sprawdź błędy |
| Clippy | `<Space>cl` | Uruchom linter |
| Format | `<Space>cf` | Sformatuj kod |
| Fix | `<Space>cx` | Auto-napraw ostrzeżenia |
| Debug | `<Space>cD` | Wybierz target do debugowania |
| Otwórz Cargo.toml | `<Space>co` | Szybki dostęp do Cargo.toml |

**Wyzwanie:** Uruchom `<Space>cl` (Clippy), napraw ostrzeżenia używając `<Space>cx`.

---

## 1.13 Okna i nawigacja

| Ćwiczenie | Komenda | Cel |
|-----------|---------|-----|
| Split pionowy | `<Space>wv` | Podziel okno pionowo |
| Split poziomy | `<Space>ws` | Podziel okno poziomo |
| Przejdź lewo | `Ctrl+h` | Przejdź do lewego okna |
| Przejdź dół | `Ctrl+j` | Przejdź do dolnego okna |
| Przejdź góra | `Ctrl+k` | Przejdź do górnego okna |
| Przejdź prawo | `Ctrl+l` | Przejdź do prawego okna |
| Zamknij okno | `<Space>wq` | Zamknij bieżące okno |
| Tylko to okno | `<Space>wo` | Zamknij wszystkie inne |
| Wyrównaj | `<Space>w=` | Wyrównaj rozmiary okien |
| Eksplorator plików | `<Space>n` | Toggle Neo-tree |

**Wyzwanie:** Otwórz 2 pliki obok siebie (`<Space>wv`), nawiguj między nimi (`Ctrl+h/l`).

---

## 1.14 Terminal

| Ćwiczenie | Komenda | Cel |
|-----------|---------|-----|
| Toggle terminal | `F12` lub `<Space>tt` | Otwórz/zamknij terminal |
| Terminal floating | `<Space>tf` | Terminal w oknie pływającym |
| Terminal poziomy | `<Space>th` | Terminal na dole |
| Terminal pionowy | `<Space>tv` | Terminal z boku |
| Terminal 1-4 | `<Space>t1` - `<Space>t4` | Przełącz numerowany terminal |
| Wybierz terminal | `<Space>ts` | Lista terminali |
| Wyślij linię | `<Space>tl` | Wyślij linię do terminala |

**Wyzwanie:** Otwórz terminal (`F12`), uruchom `cargo build`, wróć do edycji (`Esc`).

---

# CZĘŚĆ 2: Rozbudowane scenariusze

## Scenariusz 1: Refaktoryzacja funkcji

### Kontekst
Masz funkcję, która robi za dużo. Twoim zadaniem jest wydzielić logikę walidacji do osobnej funkcji.

### Kod startowy

```rust
fn process_user_data(name: &str, age: i32, email: &str) -> Result<String, String> {
    // Walidacja - do wydzielenia
    if name.is_empty() {
        return Err("Name cannot be empty".to_string());
    }
    if age < 0 || age > 150 {
        return Err("Invalid age".to_string());
    }
    if !email.contains('@') {
        return Err("Invalid email".to_string());
    }

    // Właściwa logika
    let formatted = format!("{} ({}) - {}", name, age, email);
    Ok(formatted)
}
```

### Kroki

1. **Zaznacz kod walidacji:**
   - Ustaw kursor na `if name.is_empty()`
   - `V` - tryb visual line
   - `}` - zaznacz do pustej linii (lub `8j` - 8 linii w dół)

2. **Wytnij zaznaczenie:**
   - `d` - wytnij zaznaczone linie

3. **Utwórz nową funkcję powyżej:**
   - `gg` - idź na początek pliku
   - `O` - nowa linia powyżej, insert mode
   - Wpisz sygnaturę:
   ```rust
   fn validate_user_data(name: &str, age: i32, email: &str) -> Result<(), String> {
   ```

4. **Wklej walidację:**
   - `p` - wklej wycięty kod
   - Dodaj `Ok(())` na końcu funkcji

5. **Zaktualizuj oryginalną funkcję:**
   - Dodaj wywołanie: `validate_user_data(name, age, email)?;`

6. **Sformatuj:**
   - `<Space>cf` - formatuj kod

### Oczekiwany rezultat

```rust
fn validate_user_data(name: &str, age: i32, email: &str) -> Result<(), String> {
    if name.is_empty() {
        return Err("Name cannot be empty".to_string());
    }
    if age < 0 || age > 150 {
        return Err("Invalid age".to_string());
    }
    if !email.contains('@') {
        return Err("Invalid email".to_string());
    }
    Ok(())
}

fn process_user_data(name: &str, age: i32, email: &str) -> Result<String, String> {
    validate_user_data(name, age, email)?;

    let formatted = format!("{} ({}) - {}", name, age, email);
    Ok(formatted)
}
```

---

## Scenariusz 2: Debugowanie błędu kompilacji

### Kontekst
Kod się nie kompiluje. Musisz znaleźć i naprawić wszystkie błędy.

### Kod startowy

```rust
fn calculate_average(numbers: Vec<i32>) -> f64 {
    let sum = numbers.iter().sum();
    let count = numbers.len();
    sum / count
}

fn main() {
    let data = vec![1, 2, 3, 4, 5];
    let avg = calculate_average(data);
    println!("Average: {}", avg);
    println!("Data: {:?}", data);  // błąd - data już przeniesiona
}
```

### Kroki

1. **Zbuduj projekt:**
   - `<Space>cb` - cargo build
   - Zobaczysz błędy kompilacji

2. **Przejdź do pierwszego błędu:**
   - `]d` - skocz do pierwszego błędu

3. **Przeczytaj wyjaśnienie:**
   - `ge` - pokaż błąd
   - `gE` - szczegółowe wyjaśnienie (Rust)

4. **Napraw pierwszy błąd (typy):**
   - Problem: `sum / count` - różne typy
   - Popraw na: `sum as f64 / count as f64`
   - Lub użyj `gf` jeśli LSP sugeruje poprawkę

5. **Przejdź do następnego błędu:**
   - `]d` - następny błąd

6. **Napraw błąd ownership:**
   - Zmień `numbers: Vec<i32>` na `numbers: &[i32]`
   - Zmień wywołanie na `calculate_average(&data)`

7. **Sprawdź ponownie:**
   - `<Space>ck` - cargo check
   - Powinno się skompilować

### Oczekiwany rezultat

```rust
fn calculate_average(numbers: &[i32]) -> f64 {
    let sum: i32 = numbers.iter().sum();
    let count = numbers.len();
    sum as f64 / count as f64
}

fn main() {
    let data = vec![1, 2, 3, 4, 5];
    let avg = calculate_average(&data);
    println!("Average: {}", avg);
    println!("Data: {:?}", data);
}
```

---

## Scenariusz 3: Code Review z Git

### Kontekst
Zrobiłeś zmiany w kilku miejscach i chcesz przejrzeć je przed commitem.

### Kroki

1. **Zmodyfikuj plik** (dowolny w projekcie):
   - Dodaj komentarz
   - Zmień nazwę zmiennej
   - Dodaj nową funkcję

2. **Przejrzyj zmiany:**
   - `]c` - skocz do pierwszej zmiany (hunk)
   - `<Space>ghp` - podgląd zmiany
   - `]c` - następna zmiana

3. **Selectywny staging:**
   - Na dobrej zmianie: `<Space>ghs` - stage hunk
   - Na złej zmianie: `<Space>ghr` - reset hunk (cofnij)

4. **Sprawdź co jest w staging:**
   - `<Space>gs` - git status picker
   - Lub `<Space>gg` - LazyGit

5. **Zobacz diff przed commitem:**
   - `<Space>gd` - diff picker

6. **Commituj (w LazyGit):**
   - `<Space>gg`
   - `c` - commit
   - Wpisz message
   - `Enter`

---

## Scenariusz 4: Nawigacja w nieznanym kodzie

### Kontekst
Otwierasz nowy projekt i chcesz zrozumieć jak działa funkcja `main`.

### Kroki

1. **Znajdź punkt wejścia:**
   - `<Space>fg` - grep
   - Wpisz `fn main`
   - Wybierz wynik

2. **Zrozum strukturę:**
   - `<Space>fs` - symbole w pliku
   - Zobacz listę funkcji/struktur

3. **Śledź wywołania:**
   - Ustaw kursor na wywołaniu funkcji
   - `gd` - idź do definicji
   - `K` - przeczytaj dokumentację
   - `Ctrl+o` - wróć (jump back)

4. **Znajdź użycia:**
   - Na interesującej funkcji: `gr`
   - Przejrzyj gdzie jest używana

5. **Przejrzyj typy:**
   - Na zmiennej: `gy` - idź do definicji typu
   - `K` - dokumentacja typu

6. **Nawiguj po funkcjach:**
   - `]m` - następna funkcja
   - `[m` - poprzednia funkcja

7. **Wróć do początku:**
   - `Ctrl+o` wielokrotnie - cofaj się po historii skoków
   - Lub `<Space>fr` - ostatnie pliki

---

## Scenariusz 5: Praca z wieloma plikami

### Kontekst
Musisz skopiować struct z jednego pliku i użyć go w innym, dodając implementację.

### Kroki

1. **Otwórz pierwszy plik:**
   - `<Space>ff` - znajdź plik źródłowy

2. **Podziel ekran:**
   - `<Space>wv` - split pionowy

3. **Otwórz drugi plik w nowym oknie:**
   - `<Space>ff` - znajdź plik docelowy

4. **Wróć do pierwszego okna:**
   - `Ctrl+h` - przejdź w lewo

5. **Skopiuj struct:**
   - Znajdź struct: `<Space>fs` - symbole, wybierz struct
   - `vac` - zaznacz całą strukturę
   - `y` - kopiuj

6. **Przejdź do drugiego okna:**
   - `Ctrl+l` - przejdź w prawo

7. **Wklej i dostosuj:**
   - `p` - wklej
   - Dodaj `impl` block

8. **Synchronizuj zmiany:**
   - Edytuj w jednym oknie
   - Zmiany widoczne od razu w obu

9. **Zamknij split:**
   - `<Space>wq` - zamknij bieżące okno
   - Lub `<Space>wo` - zostaw tylko bieżące

---

## Scenariusz 6: Makra i rejestry - zaawansowane

### Kontekst
Makra to nagrywanie sekwencji klawiszy i ich odtwarzanie. To jeden z najpotężniejszych mechanizmów Vim do automatyzacji powtarzalnych zadań.

### Ćwiczenie 6.1: Dodawanie typów do zmiennych

**Kod startowy:**
```rust
let name = "Alice";
let age = 30;
let active = true;
let score = 95.5;
let count = 100;
let message = "Hello";
let flag = false;
let total = 42;
```

**Cel:** Dodaj typy do wszystkich zmiennych: `let name: &str = "Alice";`

**Kroki:**
1. Ustaw kursor na pierwszej linii, na `name`
2. `qa` - rozpocznij nagrywanie do rejestru `a`
3. `f=` - skocz do znaku `=`
4. `i: &str` + `Esc` - wstaw typ (dla pierwszej linii)
5. `j0` - następna linia, początek
6. `q` - zakończ nagrywanie

**Ale każda linia ma inny typ!** Użyjmy innej strategii:

**Lepsza metoda z rejestrem:**
1. Na linii z `"Alice"`: `f=i: &str<Esc>j0`
2. Na linii z `30`: `f=i: i32<Esc>j0`
3. itd.

**Makro uniwersalne (z ręcznym typem):**
1. `qa` - nagrywaj
2. `f=a: ` + `Esc` - dodaj `: ` po nazwie
3. `q` - stop
4. Teraz `@a` doda `: ` i czeka na typ

---

### Ćwiczenie 6.2: Konwersja struktury na builder pattern

**Kod startowy:**
```rust
pub struct Config {
    pub host: String,
    pub port: u16,
    pub timeout: u64,
    pub retries: u32,
    pub debug: bool,
    pub log_level: String,
    pub max_connections: usize,
    pub buffer_size: usize,
}
```

**Cel:** Dla każdego pola wygeneruj metodę buildera:
```rust
pub fn host(mut self, value: String) -> Self {
    self.host = value;
    self
}
```

**Kroki:**
1. Skopiuj listę pól do nowego miejsca: `vi{y` + przejdź niżej + `p`
2. Ustaw kursor na `pub host: String,`
3. `qa` - nagrywaj do `a`
4. `0` - początek linii
5. `cwpub fn` + `Esc` - zamień `pub` na `pub fn`
6. `w` - następne słowo (nazwa pola)
7. `ye` - kopiuj nazwę pola
8. `f:` - skocz do `:`
9. `C(mut self, value:` + `Esc` - zamień resztę
10. `A) -> Self {` + `Esc` - dokończ sygnaturę
11. `o    self.` + `Esc` + `p` + `a = value;` + `Esc` - ciało
12. `o    self` + `Esc` - return
13. `o}` + `Esc` - zamknij
14. `j0` - następna linia
15. `q` - zakończ

16. `6@a` - zastosuj do pozostałych 6 pól

**Oczekiwany rezultat (fragment):**
```rust
pub fn host(mut self, value: String) -> Self {
    self.host = value;
    self
}
pub fn port(mut self, value: u16) -> Self {
    self.port = value;
    self
}
```

---

### Ćwiczenie 6.3: Rejestry - kopiowanie do wielu miejsc

**Kod startowy:**
```rust
fn process() {
    let data = fetch_data();

    // TODO: add error handling
    let result = transform(data);

    // TODO: add error handling
    let output = format(result);

    // TODO: add error handling
    save(output);
}
```

**Cel:** Zamień wszystkie `// TODO: add error handling` na właściwy kod obsługi błędów, ale każdy inny.

**Użycie rejestrów nazwanych:**
1. Zapisz różne fragmenty do różnych rejestrów:
   - `"ay` + zaznacz: `.map_err(|e| log::error!("Fetch failed: {}", e))?`
   - `"by` + zaznacz: `.map_err(|e| log::error!("Transform failed: {}", e))?`
   - `"cy` + zaznacz: `.map_err(|e| log::error!("Save failed: {}", e))?`

2. Przejdź do każdego TODO i:
   - Pierwsze: `dd"ap` - usuń linię, wklej z `a`
   - Drugie: `dd"bp` - usuń linię, wklej z `b`
   - Trzecie: `dd"cp` - usuń linię, wklej z `c`

**Podgląd rejestrów:**
- `:reg` - zobacz wszystkie rejestry
- `:reg a` - zobacz tylko rejestr `a`

---

### Ćwiczenie 6.4: Makro rekurencyjne

**Kod startowy:**
```rust
println!("value: {}", a);
println!("value: {}", b);
println!("value: {}", c);
println!("value: {}", d);
println!("value: {}", e);
```

**Cel:** Zmień `println!` na `debug!` we wszystkich liniach automatycznie.

**Makro rekurencyjne:**
1. `qaq` - wyczyść rejestr `a`
2. `gg` - idź na początek
3. `qa` - nagrywaj
4. `:s/println/debug/` + `Enter` - zamień w linii
5. `j` - następna linia
6. `@a` - wywołaj siebie (rekurencja!)
7. `q` - zakończ
8. `@a` - uruchom (zatrzyma się na końcu pliku)

---

## Scenariusz 7: Text Objects (mini.ai) - zaawansowane

### Kontekst
Mini.ai rozszerza standardowe text objects Vima o inteligentne obiekty oparte na Treesitter.

### Ćwiczenie 7.1: Manipulacja funkcjami

**Kod startowy:**
```rust
impl Calculator {
    

    fn substract(&self, a: i32, b: i32) -> i32 {
        let sum = a + b;
        println!("Adding {} + {}", a, b);
        sum
    }

    
  fn add(&self, a: i32, b: i32) -> i32 {
        let sum = a + b;
        println!("Adding {} + {}", a, b);
        sum
    }
    
}
```

**Zadania:**

1. **Usuń całą funkcję `multiply`:**
   - Ustaw kursor gdziekolwiek w funkcji `multiply`
   - `daf` - delete around function

2. **Skopiuj ciało funkcji `add` do `subtract`:**
   - W funkcji `add`: `yif` - yank inner function (tylko ciało)
   - W funkcji `subtract`: `vif` - zaznacz ciało
   - `p` - wklej (zamieni)

3. **Zamień całą funkcję `divide` na nową:**
   - W funkcji `divide`: `caf` - change around function
   - Wpisz nową implementację

4. **Przenieś funkcję `add` na koniec impl:**
   - `daf` - wytnij funkcję
   - `]m]m]m` - skocz do ostatniej funkcji
   - `}` - koniec funkcji
   - `p` - wklej

---

### Ćwiczenie 7.2: Praca z parametrami

**Kod startowy:**
```rust
fn create_user(
    
) -> User {
    User::new(name, email, age, department, salary)
}

fn send_email(to: &str, subject: &str, body: &str, cc: Option<&str>) {
    // implementation
}
```

**Zadania:**

1. **Usuń parametr `is_admin` z `create_user`:**
   - Ustaw kursor na `is_admin`
   - `daa` - delete around argument (usunie też przecinek)

2. **Zmień parametr `age: u32` na `birth_year: i32`:**
   - Ustaw kursor na `age`
   - `cia` - change inner argument
   - Wpisz: `birth_year: i32`

3. **Skopiuj parametr `email` i dodaj jako `backup_email`:**
   - Na `email: String`: `yia` - kopiuj argument
   - Przejdź na koniec listy parametrów
   - `a, ` + `Esc` + `p` - wklej
   - Zmień nazwę na `backup_email`

4. **Zaznacz wszystkie parametry `send_email`:**
   - Wewnątrz nawiasów: `vi(` - zaznacz wewnątrz ()

---

### Ćwiczenie 7.3: Praca z blokami warunkowymi i pętlami

**Kod startowy:**
```rust
fn process_items(items: Vec<Item>) -> Result<(), Error> {
    for item in items {
        if item.is_valid() {
            match item.item_type {
                ItemType::A => {
                    println!("Processing A");
                    handle_a(item)?;
                }
                ItemType::B => {
                    println!("Processing B");
                    handle_b(item)?;
                }
                _ => {
                    println!("Unknown type");
                }
            }
        } else {
            log::warn!("Invalid item: {:?}", item);
            continue;
        }
    }

    Ok(())
}
```

**Zadania:**

1. **Usuń całą pętlę for:**
   - Ustaw kursor gdziekolwiek w pętli
   - `dao` - delete around loop

2. **Skopiuj blok if do nowej funkcji:**
   - W bloku if: `yai` - yank around if (cały if-else)
   - Stwórz nową funkcję i `p`

3. **Zamień ciało else:**
   - W bloku else: `cii` - change inner if (ciało else)
   - Wpisz nowy kod

4. **Nawigacja między blokami:**
   - `]m` - następna funkcja
   - `[m` - poprzednia funkcja
   - Wewnątrz funkcji użyj `%` do skakania między nawiasami

---

### Ćwiczenie 7.4: Praca ze strukturami i impl

**Kod startowy:**
```rust
#[derive(Debug, Clone)]
pub struct Server {
    host: String,
    port: u16,
    connections: Vec<Connection>,
}

impl Server {
    pub fn new(host: String, port: u16) -> Self {
        Self {
            host,
            port,
            connections: Vec::new(),
        }
    }

    pub fn start(&mut self) -> Result<(), Error> {
        println!("Starting server on {}:{}", self.host, self.port);
        Ok(())
    }
}

impl Drop for Server {
    fn drop(&mut self) {
        println!("Server shutting down");
    }
}
```

**Zadania:**

1. **Skopiuj cały struct:**
   - Na linii `pub struct Server`: `vac` - zaznacz całą klasę/struct
   - `y` - kopiuj

2. **Usuń drugi impl (Drop):**
   - Gdziekolwiek w `impl Drop`: `dac` - delete around class

3. **Zaznacz wszystkie pola struct:**
   - Wewnątrz struct: `vi{` - zaznacz wewnątrz {}

4. **Skocz między impl:**
   - `]]` - następny struct/impl
   - `[[` - poprzedni struct/impl

---

## Scenariusz 8: Surround (mini.surround) - zaawansowane

### Kontekst
Mini.surround pozwala dodawać, usuwać i zamieniać otaczające znaki (cudzysłowy, nawiasy, tagi).

### Ćwiczenie 8.1: Konwersja stringów

**Kod startowy:**
```rust
let query = "SELECT * FROM users WHERE id = " + id;
let message = "Hello " + name + "!";
let path = "/home/" + user + "/documents";
let sql = "INSERT INTO logs VALUES (" + timestamp + ", " + level + ")";
```

**Cel:** Zamień konkatenację na format!()

**Przed:**
```rust
let query = "SELECT * FROM users WHERE id = " + id;
```

**Po:**
```rust
let query = format!("SELECT * FROM users WHERE id = {}", id);
```

**Kroki dla każdej linii:**
1. Usuń wszystkie `" + ` i ` + "`:
   - `:%s/" + /{}"/g` - zamień końce stringów
   - `:%s/ + "/"/g` - zamień początki

2. Dla każdej linii dodaj `format!()`:
   - Na początku stringa: `saiw)` - otocz słowo nawiasem... nie, lepsza metoda:
   - `f"` - znajdź cudzysłów
   - `va"` - zaznacz cały string z cudzysłowami
   - `sa)` - otocz nawiasami
   - `iformat!` - dodaj format! przed

**Lub użyj makra:**
1. `qa`
2. `0f"va"sa)iformat!<Esc>`
3. `j0`
4. `q`
5. `3@a`

---

### Ćwiczenie 8.2: Zamiana typów Option/Result

**Kod startowy:**
```rust
fn get_user(id: i32) -> iOption < User > {
    database.find(id)
}

fn parse_number(s: &str) -> i32 {
    s.parse().unwrap()
}

fn read_file(path: &str) -> String {
    std::fs::read_to_string(path).unwrap()
}

fn divide(a: i32, b: i32) -> i32 {
    a / b
}
```

**Cel:** Zamień typy zwracane na Option<T> lub Result<T, Error>

**Kroki:**
1. Dla `-> User` zamień na `-> Option<User>`:
   - Ustaw kursor na `User` (typ zwracany)
   - `saiw>` - otocz nawiasami kątowymi `<User>`
   - `iOption` - dodaj Option przed

2. Dla `-> i32` zamień na `-> Result<i32, Error>`:
   - `saiw>` - `<i32>`
   - `iResult` - `Result<i32>`
   - `f>i, Error` - `Result<i32, Error>`

**Makro dla Option:**
1. `qa`
2. `f>b` - znajdź `>` i cofnij (jesteśmy na typie)
3. `saiw>iOption<Esc>` - otocz i dodaj Option
4. `q`

---

### Ćwiczenie 8.3: Praca z zagnieżdżonymi strukturami

**Kod startowy:**
```rust
let data = vec![1, 2, 3];
let result = Some(Ok("success"));
let nested = vec![vec![1, 2], vec![3, 4]];
let complex = Some(vec![Ok(1), Err("error")]);
```

**Zadania:**

1. **Rozpakuj zewnętrzny vec![]:**
   - Na `vec![1, 2, 3]`: `sd]` - usuń nawiasy []
   - Zostanie: `vec!1, 2, 3` - ups, to nie działa!

   **Lepsza metoda:**
   - `vi[` - zaznacz wewnątrz []
   - `y` - kopiuj
   - `va[` - zaznacz z nawiasami
   - `p` - wklej (zamieni całość na zawartość)

2. **Zamień Some() na Ok():**
   - Na `Some`: `ciw` + `Ok` - zmień słowo

3. **Dodaj dodatkowe zagnieżdżenie:**
   - `let data = vec![1, 2, 3]` → `let data = Some(vec![1, 2, 3])`
   - Zaznacz `vec![1, 2, 3]`: `va[`
   - `sa)` - otocz nawiasami
   - `iSome` - dodaj Some

---

### Ćwiczenie 8.4: Konwersja closure na funkcję

**Kod startowy:**
```rust
let double = |x| x * 2;
let add = |a, b| a + b;
let greet = |name| println!("Hello, {}", name);
let complex = |x, y, z| {
    let sum = x + y;
    sum * z
};
```

**Cel:** Zamień closure na pełne funkcje

**Przed:** `let double = |x| x * 2;`
**Po:**
```rust
fn double(x: i32) -> i32 {
    x * 2
}
```

**Kroki:**
1. Zamień `let double = ` na `fn double`:
   - `0` - początek linii
   - `cw` - change word
   - `fn` - wpisz fn
   - `w` - następne słowo
   - `dw` - usuń `= `

2. Zamień `|x|` na `(x: i32)`:
   - `sr|)` - zamień | na ()
   - `ea: i32` - dodaj typ po x

3. Zamień `x * 2;` na `-> i32 { x * 2 }`:
   - `f;` - znajdź średnik
   - `C -> i32 {` - zamień do końca
   - `o    x * 2` + `Esc`
   - `o}` + `Esc`

**Lub użyj visual mode:**
1. Zaznacz całą linię closure: `V`
2. Przekształć ręcznie lub użyj substytucji

---

### Ćwiczenie 8.5: Manipulacja atrybutami Rust

**Kod startowy:**
```rust
struct User {
    name: String,
    email: String,
    age: u32,
}

fn main() {
    println!("Hello");
}

fn helper() {
    // code
}
```

**Cel:** Dodaj atrybuty do struct i funkcji

**Dodaj #[derive(Debug, Clone)]:**
1. Na linii `struct User`:
   - `O` - nowa linia powyżej, insert mode
   - `#[derive(Debug, Clone)]` + `Esc`

**Dodaj #[cfg(test)] do funkcji:**
1. Można użyć surround na całej funkcji:
   - `vaf` - zaznacz całą funkcję
   - Nie ma wbudowanego otoczenia dla atrybutów, więc:
   - `O#[cfg(test)]` + `Esc` - dodaj ręcznie

**Zamień istniejący atrybut:**
Jeśli masz `#[derive(Debug)]` i chcesz `#[derive(Debug, Clone, Serialize)]`:
1. `f(` - znajdź nawias
2. `ci(` - zmień wewnątrz ()
3. Wpisz nową zawartość

---

# Wskazówki końcowe

## Budowanie nawyków

1. **Codziennie** przećwicz 2-3 krótkie ćwiczenia z Części 1
2. **Co tydzień** zrób jeden scenariusz z Części 2
3. **Wyłącz strzałki** - użyj `:noremap <Up> <Nop>` itd.
4. **Używaj `.`** - powtarza ostatnią zmianę
5. **Używaj `u`** - cofnij, `Ctrl+r` - ponów

## Najważniejsze kombinacje do zapamiętania

| Combo | Akcja |
|-------|-------|
| `ciw` | Zmień słowo |
| `ci"` | Zmień w cudzysłowie |
| `daf` | Usuń funkcję |
| `vif` | Zaznacz ciało funkcji |
| `gd` | Idź do definicji |
| `gr` | Znajdź użycia |
| `gf` | Szybka poprawka |
| `<Space>ff` | Znajdź plik |
| `<Space>fg` | Grep w plikach |
| `<Space>gg` | LazyGit |

## Debugging workflow

```
1. <Space>ck          → Sprawdź błędy
2. ]d                 → Idź do błędu
3. ge / gE            → Przeczytaj błąd
4. gf                 → Napraw automatycznie
5. <Space>ck          → Sprawdź ponownie
```

## Szybkie zapamiętywanie

- **d** = delete (usuń)
- **c** = change (zmień)
- **y** = yank (kopiuj)
- **v** = visual (zaznacz)
- **i** = inner (wewnątrz)
- **a** = around (wokół)
- **f** = function
- **w** = word
- **s** = surround
