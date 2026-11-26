# Unit review — 国税徴収法施行規則 art.1_6（随意契約時の公売規定準用 / READING）

Normative unit id: `NORM|d692d7da2457a4ea5be1755917ebce9dfa13d8603fbb818e406590ddb54966c4`
Law: 国税徴収法施行規則 (`337M50000040031`), revision `337M50000040031_20260521_506M60000040023` (`CurrentEnforced`).
Source: `data/raw/337M50000040031_20260521_506M60000040023.law.json`
SHA-256 (CRLF→LF): `7cdedf968d8411bfc591f5fba6f89d4885939f595772f6dfde9a302b63c847af`
Provision: `LawBody[2]/MainProvision/MainProvision[5]/Article:1_6/Article#1_6/ArticleCaption`

Verbatim (READING): 「（随意契約により不動産を売却する場合における公売の規定の準用）」

## Source correspondence (independent of Lean)

| field | value |
|---|---|
| H | In a private-contract sale of real property, the public-auction provisions are applied mutatis mutandis. Mode codes: 0 = 随意契約 → 1 = 公売; others preserved. Numerals are mode tags, not amounts. |
| T | Pin + `transcription_audit.py` needle scoped to `第一条の六`. Independent audit: needle whole law = 1, scoped (775 chars) = 1; SHA/revision match INVENTORY. |
| D | PASS — verbatim-unique needle, correct revision, no blocking transcription defect. |
| C | 附則 has no duplicate. Only the reading substitution is modelled, not the auction procedure. |
| U | Private-contract conditions and the auction procedure's substance need their own units. Human legal review `LEGAL_REVIEW_PENDING`. |

## Model and proof

- Impl: `PrivateContractPublicAuctionReading.lean` — `asPublicAuction : Nat → Nat | 0 => 1 | n+1 => n+1`, with `private_becomes_auction`, `auction_preserved`, `other_preserved`, universal `idempotent`.
- Independent spec: `PrivateContractPublicAuctionReadingSpec.lean` — `specAsPublicAuction c := if c = 0 then 1 else c`, no implementation definitions reused.
- Universal kernel proof: `agree_as_public_auction (c : Nat)` — `cases c <;> rfl`; axiom-free (no `omega`, no `simp`, no `Classical.choice`).
- Tests: 9 kernel-decided examples; boundary categories `{zero, small_input, saturation}`.

Not modelled: private-contract conditions, public-auction procedure, other articles. Human legal review remains `LEGAL_REVIEW_PENDING`.
