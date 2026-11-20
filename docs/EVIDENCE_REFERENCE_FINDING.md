# Adversarial finding — evidence strings name documents they do not support

Independent resolution of the verification-evidence ledger against the actual
artifacts (`scripts/ci/audit_evidence_references.py`). This records a defect in
the *completion determination*, not a defect in the statute.

| 記号 | 内容 |
|---|---|
| H（反証可能仮説） | 各 `FULLY_VERIFIED` 単位の `adversarial_review` / `implementation` 等の証拠文字列は、引用先の成果物によって実際に裏付けられている。 |
| T（再現検査） | 証拠文字列から `Batch X`・モジュール名・sha256・CI run を抽出し、`docs/ADVERSARIAL_REVIEW.md` の当該セクション、Lean ファイルの実ハッシュ、`PROOF_ATTESTATION.json` と照合。 |
| D（合否） | **FAIL**。初回測定では 364 件中 54 件が unresolved（`adversarial_review` 51 件＋sha256 3 件）。その後の是正により最新測定は 44 件中 10 件 unresolved（`adversarial_review` 7 件＋sha256 3 件）。**実測値は常に生成物 `docs/EVIDENCE_REFERENCE_AUDIT.md` / `data/EVIDENCE_REFERENCE_AUDIT.json` を参照すること。** |
| C（対立解釈） | テンプレート文字列は「同じレビュー手法を全モジュールに適用した」という意図だった可能性がある。しかし §4 は独立レビューを要求し、§5 は登録検査の成功と全義務完了を区別する。セクションに名前の無いモジュールを「レビュー済み」と数えることは完了判定の過大計上である。 |
| U（不確かさ） | 参照解決は成果物の同一性のみを検査する。法的正当性・証明の健全性・人間レビューはここでは判定しない。 |

## 実測の内訳

```
初回: evidence references 310/364 resolved, 54 unresolved
      adversarial_review 51, implementation 1, independent_spec 1, tests 1
最新: evidence references  34/44  resolved, 10 unresolved
      adversarial_review  7, implementation 1, independent_spec 1, tests 1
      false module claims: LocalGrantRevenueBase 2, LocalAddedValueStandard 2,
      IncomeArt205Withholding 1, PublicPensionWithholding 1,
      LocalTaxMedicalIncomeRatio 1
```

## 必要な処置（未完了）

1. 残る `adversarial_review` 証拠について、実際にそのモジュールを含むレビューセクションを指定し直す（または軸を `NOT_RECORDED` に戻す）。初回 51 件 → 最新 7 件に減少済み。
2. 3 件の sha256 不一致を再アテストするか、該当軸を無効化する。
3. 上記が完了するまで `--strict` モードを有効にせず、現状は Ledger と本 finding で可視化のみ行う。
4. 人間法的レビューは `LEGAL_REVIEW_PENDING` のまま保持する。
