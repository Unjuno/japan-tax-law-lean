# Adversarial finding — 相続税法 art. 21-5 (¥600,000 basic deduction)

独立経路による照合（原文Snapshot→別経路の記事スキャン／PR #188 の Lean ファイル直接取得）。
これは反証可能な発見の記録であり、完成宣言ではない。

- 対象規範: `NORM|52ff866ebec866122bfcf42be9c0fbc69d8bbea9d64fe5975a5e4d7225790ba7`
- 原文: `data/raw/325AC0000000073_20260401_506AC0000000008.law.json`
- 施行版: `325AC0000000073_20260401_506AC0000000008`（2026-04-01）

| 記号 | 内容 |
|---|---|
| H（反証可能仮説） | 「課税価格から六十万円を控除する」は art. 21-5 にのみ現れるため、needle の記事帰属は一意に決定できる。 |
| T（再現検査） | 固定 JSON の全 `Article` を独立に走査し、正規化文字列の部分一致を列挙（`scripts/ci/transcription_audit.py` の経路とは別の走査）。 |
| D（合否） | **FAIL（一意性仮説は反証された）**。needle は `21_5` と `21_11_2` の **2 記事**に現れる。`21_5` での一致自体は PASS。 |
| C（対立解釈） | `21_11_2`（非居住者等の贈与税額計算の特例）は art. 21-5 の基礎控除を **参照して適用**する文脈で同じ語句を再利用している。したがって「21-5 に存在する」という帰属は正しいが、「21-5 にしか存在しない」という強い主張は誤り。原文対応監査は regel 21-5 の本文典故を記録し、21-11-2 を cross-reference として別に記録すべき。 |
| U（不確かさ） | これは transcription / scope の発見であり、法的正当性や art. 21-11-2 の適用関係の解釈を確定するものではない。人間レビューは未実施。 |

## 有力な補助証拠

- PR #188 の Lean 3 ファイルを直接取得し、コメント（行・ブロック）を除去した上で
  `sorry / admit / axiom / Classical.choice` を走査: **0 件**。
- `GiftBasicDeductionUnitSpec.lean` に `agree_gift_basic_deduction`,
  `specResult_eq_zero_of_le`, `specResult_le_base`, `cross_law_constant` の
  4 定理が存在（定理名の文字列一致は証明ではない。Lean カーネル確認は CI に委ねる）。
- Three Lean files all contain the constant `600_000` / `600000`.

## 必要な処置（未完了）

1. `docs/UNIT_GIFT_BASIC_DEDUCTION_21_5.md` の C 欄に、art. 21-11-2 での再利用を追記する。
2. この規範単位の `unhandled_conditions` に `NEEDLE_REUSED_IN_21_11_2` を記録し、
   scope を `COMPUTABLE_SLICE` のまま維持する（FULLY_VERIFIED に昇格させない）。
3. 人間レビューは `LEGAL_REVIEW_PENDING` のまま保持する。
