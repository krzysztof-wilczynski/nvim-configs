# Skróty klawiszowe - Neovim dla Rust

## Nawigacja po projekcie

| Skrót | Akcja |
|-------|-------|
| `<Space><space>` | Inteligentne wyszukiwanie |
| `<Space>ff` | Szukaj pliku |
| `<Space>fg` | Szukaj w treści (grep) |
| `<Space>fr` | Ostatnie pliki |
| `<Space>n` | Eksplorator plików |
| `<Space>fp` | Projekty |
| `<Space>fb` | Bufory |
| `<Space>fn` | Powiadomienia |
| `<Space>fc` | Pliki konfiguracji |
| `<Space>fh` | Pomoc |
| `<Space>fk` | Skróty klawiszowe |
| `<Space>fa` | Polecenia |
| `<Space>fq` | Lista quickfix |
| `<Space>ft` | Szukaj TODO |
| `<Space>f]` | Motywy kolorów |

## Nawigacja po kodzie (LSP)

| Skrót | Akcja |
|-------|-------|
| `gd` | Idź do definicji |
| `gD` | Idź do deklaracji |
| `gr` | Znajdź użycia (odniesienia) |
| `gI` | Implementacje |
| `gy` | Definicja typu |
| `K` | Dokumentacja (hover) |
| `<Space>fs` | Szukaj symbolu |
| `<Space>fS` | Szukaj symbolu (workspace) |
| `<Space>q` | Lista diagnostyki |

## Akcje kodu i diagnostyka

| Skrót | Akcja |
|-------|-------|
| `ga` | Menu akcji kodu (code action) |
| `gf` | Szybka poprawka (bez menu) |
| `gF` | Napraw wszystko w pliku |
| `ge` | Pokaż błąd (float) |
| `]d` | Następny błąd |
| `[d` | Poprzedni błąd |

## Cargo/Rust

| Skrót | Akcja |
|-------|-------|
| `<Space>cr` | Uruchom |
| `<Space>cR` | Uruchom w terminalu |
| `<Space>cb` | Buduj |
| `<Space>ct` | Testy |
| `<Space>cT` | Wybierz test (rust-analyzer) |
| `<Space>ctn` | Powtórz ostatni test |
| `<Space>ck` | Sprawdź błędy (check) |
| `<Space>cl` | Clippy |
| `<Space>cf` | Formatuj (rustfmt) |
| `<Space>cx` | Napraw ostrzeżenia |
| `<Space>cc` | Wyczyść (clean) |
| `<Space>cB` | Benchmark |

### Rust-analyzer (tylko w plikach .rs)

| Skrót | Akcja |
|-------|-------|
| `gE` | Wyjaśnij błąd (szczegółowo) |
| `gR` | Renderuj diagnostykę |
| `<Space>cm` | Rozwiń makro |
| `<Space>ch` | Akcje hover |
| `<Space>cj` | Złącz linie |
| `<Space>co` | Otwórz Cargo.toml |
| `<Space>cP` | Moduł nadrzędny |
| `<Space>cRR` | Lista uruchamialnych |

### Zależności

| Skrót | Akcja |
|-------|-------|
| `<Space>cda` | Dodaj zależność |
| `<Space>cdx` | Usuń zależność |
| `<Space>cdu` | Aktualizuj |
| `<Space>cdo` | Przestarzałe |
| `<Space>cdt` | Drzewo zależności |
| `<Space>cdA` | Audyt bezpieczeństwa |
| `<Space>cdv` | Vendor |

### Projekt

| Skrót | Akcja |
|-------|-------|
| `<Space>cpn` | Nowy projekt |
| `<Space>cpd` | Dokumentacja |
| `<Space>cpp` | Publikuj |
| `<Space>cpi` | Instaluj binarkę |
| `<Space>cpu` | Odinstaluj |
| `<Space>cps` | Szukaj crate |

## Debugowanie

| Skrót | Akcja |
|-------|-------|
| `<Space>db` | Toggle breakpoint |
| `<Space>dB` | Breakpoint warunkowy |
| `<Space>cD` | Debug (wybierz target) |
| `<Space>cdr` | Powtórz debug |
| `<Space>dc` | Kontynuuj / Start |
| `<Space>dC` | Uruchom do kursora |
| `<Space>di` | Step into (wejdź w funkcję) |
| `<Space>do` | Step over (następna linia) |
| `<Space>dO` | Step out (wyjdź z funkcji) |
| `<Space>dp` | Pauza |
| `<Space>dr` | Restart |
| `<Space>dq` | Zakończ |
| `<Space>du` | Panel debuggera |
| `<Space>de` | Ewaluuj wyrażenie |

## Git

| Skrót | Akcja |
|-------|-------|
| `<Space>gg` | LazyGit (pełny UI) |
| `<Space>gs` | Status |
| `<Space>gb` | Gałęzie |
| `<Space>gl` | Historia |
| `<Space>gL` | Historia linii |
| `<Space>gf` | Historia pliku |
| `<Space>gd` | Różnice (diff) |
| `<Space>gS` | Schowek (stash) |
| `<Space>go` | Otwórz w przeglądarce |

### Git hunks (gitsigns)

| Skrót | Akcja |
|-------|-------|
| `]c` | Następny hunk |
| `[c` | Poprzedni hunk |
| `<Space>ghs` | Stage hunk |
| `<Space>ghr` | Reset hunk |
| `<Space>ghS` | Stage buffer |
| `<Space>ghR` | Reset buffer |
| `<Space>ghp` | Preview hunk |
| `<Space>ghb` | Blame line |
| `<Space>ghd` | Diff this |

## Okna

| Skrót | Akcja |
|-------|-------|
| `Ctrl+h` | Fokus lewo |
| `Ctrl+j` | Fokus dół |
| `Ctrl+k` | Fokus góra |
| `Ctrl+l` | Fokus prawo |
| `<Space>wv` | Podziel pionowo |
| `<Space>ws` | Podziel poziomo |
| `<Space>wq` | Zamknij okno |
| `<Space>wo` | Tylko to okno |
| `<Space>w=` | Wyrównaj rozmiary |
| `Ctrl+↑` | Zwiększ wysokość |
| `Ctrl+↓` | Zmniejsz wysokość |
| `Ctrl+←` | Zmniejsz szerokość |
| `Ctrl+→` | Zwiększ szerokość |

## Zakładki (taby)

| Skrót | Akcja |
|-------|-------|
| `<Space><Tab><Tab>` | Nowa zakładka |
| `<Space><Tab>e` | Następna |
| `<Space><Tab>q` | Poprzednia |
| `<Space><Tab>l` | Ostatnia |
| `<Space><Tab>f` | Pierwsza |
| `<Space><Tab>d` | Zamknij |
| `<Space><Tab>o` | Tylko ta |

## Terminal

| Skrót | Akcja |
|-------|-------|
| `F12` | Toggle terminal |
| `<Space>tt` | Toggle terminal |
| `<Space>th` | Terminal poziomy |
| `<Space>tv` | Terminal pionowy |
| `<Space>tf` | Terminal pływający |
| `<Space>tT` | Terminal w karcie |
| `<Space>t1-4` | Przełącz na terminal 1-4 |
| `<Space>ts` | Wybierz terminal z listy |
| `<Space>tn` | Nowy nazwany terminal |
| `<Space>ta` | Toggle wszystkie terminale |
| `<Space>tl` | Wyślij linię do terminala |
| `<Space>tl` (visual) | Wyślij zaznaczenie |

### W terminalu

| Skrót | Akcja |
|-------|-------|
| `Esc` | Wyjście do normal mode |
| `Ctrl+h/j/k/l` | Nawigacja między oknami |

## Diagnostyka (Trouble)

| Skrót | Akcja |
|-------|-------|
| `<Space>xx` | Diagnostyka (workspace) |
| `<Space>xd` | Diagnostyka (dokument) |
| `<Space>xs` | Symbole |
| `<Space>xq` | Quickfix |
| `<Space>xl` | Location list |
| `<Space>xr` | LSP referencje |
| `<Space>xt` | Lista TODO |

## TODO-comments

| Skrót | Akcja |
|-------|-------|
| `]t` | Następne TODO |
| `[t` | Poprzednie TODO |

## Textobjects (mini.ai + Treesitter)

### Zaznaczanie

| Skrót | Akcja |
|-------|-------|
| `af` / `if` | Funkcja (outer/inner) |
| `ac` / `ic` | Klasa (outer/inner) |
| `aa` / `ia` | Parametr (outer/inner) |
| `ao` / `io` | Pętla (outer/inner) |
| `ai` / `ii` | Warunek if (outer/inner) |

### Nawigacja

| Skrót | Akcja |
|-------|-------|
| `]m` / `[m` | Następna/poprzednia funkcja |
| `]]` / `[[` | Następna/poprzednia klasa |

## Sesje (auto-session)

| Skrót | Akcja |
|-------|-------|
| `<Space>Sl` | Lista sesji (picker) |
| `<Space>Ss` | Zapisz sesję |
| `<Space>Sr` | Przywróć sesję |
| `<Space>Sd` | Usuń sesję |

Sesje zapisują się automatycznie przy wyjściu z nvim.
Neo-tree i terminale są zamykane przed zapisem (nie psują layoutu).
Na dashboardzie: `s` - przywróć sesję dla bieżącego katalogu.

## Markdown

| Skrót | Akcja |
|-------|-------|
| `<Space>m` | Toggle podgląd Markdown (renderowany/źródłowy) |

## Inne

| Skrót | Akcja |
|-------|-------|
| `Ctrl+s` | Zapisz |
| `Ctrl+Enter` | Nowa linia (Rust: średnik + nowa linia) |
| `<` / `>` | Wcięcia (visual mode) |
| `<Space>?` | Pokaż wszystkie skróty |
| `Esc` | Wyczyść podświetlenie wyszukiwania |

---

## Typowy workflow

```
1. Otwórz projekt          → <Space>fp
2. Znajdź plik             → <Space>ff
3. Pisz kod                → K (hover), gd (definicja)
4. Pokaż błąd              → ge (float) lub gE (szczegóły Rust)
5. Napraw błąd             → ga (menu) lub gf (szybka poprawka)
6. Sprawdź projekt         → <Space>ck lub <Space>cl
7. Uruchom                 → <Space>cr
8. Debug                   → <Space>db + <Space>cD
9. Testy                   → <Space>ct lub <Space>cT
10. Commit                 → <Space>gg
```
