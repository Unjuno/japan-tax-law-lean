# Normative unit — 322CO0000000109 art.3（同一嘱託書による登記嘱託）

Unit: `NORM|368f77444888dd8e28bda37fa5deb1bae1d03502d1f8c036d2975e32fd768f5e`
Snapshot: 2026-11-15; enforced revision `322CO0000000109_19470627_000000000000000`.

## Original text (pinned, verbatim, 87 chars)

「前二条の場合において同一の登記所の管轄内に在る二箇以上の不動産につき登記を嘱託するには、登記原因又は登記の目的が同一でなくても、同一の嘱託書でその登記を嘱託することができる。」

`data/raw/322CO0000000109_19470627_000000000000000.law.json`,
sha256 `9ff39f03e58b315d04fbb65246dd5a4e64cf8c6a428eae84c53bb49c530816ec`.

## Normative decomposition (this unit only)

| 原文 | 形式変数 | 型・単位 | caller-established? |
|---|---|---|---|
| 前二条の場合 | `priorCase` | Bool | yes |
| 同一の登記所の管轄内 | `sameRegistry` | Bool | yes |
| 二箇以上の不動産 | `propertyCount` | Nat, 個 | yes |
| 登記原因・目的が同一でなくても | `causesOrPurposeDiffer` | Bool | yes; 判定に不使用 |
| 同一の嘱託書で嘱託することができる | `mayUseSingleRequest = true` | Bool | 帰結 |

独立仕様 `RegistrationJointRequestSpec.permitted` は実装を import せず原文から
別経路で定義し、`agrees_with_implementation` でカーネル同値を証明する。

## H / T / D / C / U

| id | content |
|---|---|
| H | 当該一文の許容判定は、前二条・同一登記所・二箇以上の三条件にのみ依存し、登記原因・目的の異同に依存しない。 |
| T | `lake build JapanTaxLaw.RegistrationJointRequestTests`（一般命題 2 本 + kernel-decided 境界例 16）、`python scripts/ci/source_audit_registration_art3.py`（verbatim/literals/独立仕様の3検査）。 |
| D | 実装・独立仕様の同値はカーネルで証明され、境界 0/1（不許可）・2/3（許可）・原因異同独立・各条件分岐が決定された。原文照合3検査すべて true。 |
| C | 対立解釈: 「二箇以上」を「二つを超える」と読む → 原文の「以上」に反するので採用しない。また「同一でなくても」を追加条件と読む → 文言は例外の不適用を表すため採用しない。 |
| U | 前二条の具体的要件・登記所管轄の境界・嘱託書の記載事項は NOT MODELLED / caller-established。人間による法的レビューは未实施（LEGAL_REVIEW_PENDING）。本成果は当該規範単位のみであり条全体の完成を主張しない。 |

## Verification

- Lean 4.35.0（pinned）, `lake build`: 533 jobs success.
- `check_no_sorry.py`: no forbidden placeholder proofs.
- Axiom probe: no `sorryAx` / `Classical.choice` in the key theorems of this unit.
