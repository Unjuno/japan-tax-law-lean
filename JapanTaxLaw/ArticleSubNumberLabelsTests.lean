import JapanTaxLaw.ArticleSubNumberLabels
import JapanTaxLaw.ArticleSubNumberLabelsSpec

/-!
# ArticleSubNumberLabelsTests — 条番号＋のN ラベル構造（全variant）
-/
namespace JapanTaxLaw.ArticleSubNumberLabelsTests

open JapanTaxLaw.ArticleSubNumberLabels

example : "第四条の四" == "第四条の四" := rfl  -- keep import live

example : isArticleSubLabel "第一条の七" = true := by native_decide
example : isArticleSubLabel "第一条の七" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第一条の七" := by native_decide
example : isArticleSubLabel "第一条の九" = true := by native_decide
example : isArticleSubLabel "第一条の九" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第一条の九" := by native_decide
example : isArticleSubLabel "第一条の五" = true := by native_decide
example : isArticleSubLabel "第一条の五" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第一条の五" := by native_decide
example : isArticleSubLabel "第一条の八" = true := by native_decide
example : isArticleSubLabel "第一条の八" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第一条の八" := by native_decide
example : isArticleSubLabel "第一条の六" = true := by native_decide
example : isArticleSubLabel "第一条の六" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第一条の六" := by native_decide
example : isArticleSubLabel "第一条の十" = true := by native_decide
example : isArticleSubLabel "第一条の十" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第一条の十" := by native_decide
example : isArticleSubLabel "第一条の十一" = true := by native_decide
example : isArticleSubLabel "第一条の十一" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第一条の十一" := by native_decide
example : isArticleSubLabel "第一条の十七" = true := by native_decide
example : isArticleSubLabel "第一条の十七" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第一条の十七" := by native_decide
example : isArticleSubLabel "第一条の十三" = true := by native_decide
example : isArticleSubLabel "第一条の十三" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第一条の十三" := by native_decide
example : isArticleSubLabel "第一条の十九" = true := by native_decide
example : isArticleSubLabel "第一条の十九" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第一条の十九" := by native_decide
example : isArticleSubLabel "第一条の十二" = true := by native_decide
example : isArticleSubLabel "第一条の十二" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第一条の十二" := by native_decide
example : isArticleSubLabel "第一条の十五" = true := by native_decide
example : isArticleSubLabel "第一条の十五" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第一条の十五" := by native_decide
example : isArticleSubLabel "第一条の十八" = true := by native_decide
example : isArticleSubLabel "第一条の十八" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第一条の十八" := by native_decide
example : isArticleSubLabel "第一条の十六" = true := by native_decide
example : isArticleSubLabel "第一条の十六" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第一条の十六" := by native_decide
example : isArticleSubLabel "第一条の十四" = true := by native_decide
example : isArticleSubLabel "第一条の十四" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第一条の十四" := by native_decide
example : isArticleSubLabel "第一条の四" = true := by native_decide
example : isArticleSubLabel "第一条の四" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第一条の四" := by native_decide
example : isArticleSubLabel "第七十一条の七" = true := by native_decide
example : isArticleSubLabel "第七十一条の七" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七十一条の七" := by native_decide
example : isArticleSubLabel "第七十一条の九" = true := by native_decide
example : isArticleSubLabel "第七十一条の九" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七十一条の九" := by native_decide
example : isArticleSubLabel "第七十一条の五" = true := by native_decide
example : isArticleSubLabel "第七十一条の五" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七十一条の五" := by native_decide
example : isArticleSubLabel "第七十一条の五十" = true := by native_decide
example : isArticleSubLabel "第七十一条の五十" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七十一条の五十" := by native_decide
example : isArticleSubLabel "第七十一条の五十一" = true := by native_decide
example : isArticleSubLabel "第七十一条の五十一" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七十一条の五十一" := by native_decide
example : isArticleSubLabel "第七十一条の五十七" = true := by native_decide
example : isArticleSubLabel "第七十一条の五十七" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七十一条の五十七" := by native_decide
example : isArticleSubLabel "第七十一条の五十三" = true := by native_decide
example : isArticleSubLabel "第七十一条の五十三" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七十一条の五十三" := by native_decide
example : isArticleSubLabel "第七十一条の五十九" = true := by native_decide
example : isArticleSubLabel "第七十一条の五十九" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七十一条の五十九" := by native_decide
example : isArticleSubLabel "第七十一条の五十二" = true := by native_decide
example : isArticleSubLabel "第七十一条の五十二" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七十一条の五十二" := by native_decide
example : isArticleSubLabel "第七十一条の五十五" = true := by native_decide
example : isArticleSubLabel "第七十一条の五十五" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七十一条の五十五" := by native_decide
example : isArticleSubLabel "第七十一条の五十八" = true := by native_decide
example : isArticleSubLabel "第七十一条の五十八" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七十一条の五十八" := by native_decide
example : isArticleSubLabel "第七十一条の五十六" = true := by native_decide
example : isArticleSubLabel "第七十一条の五十六" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七十一条の五十六" := by native_decide
example : isArticleSubLabel "第七十一条の五十四" = true := by native_decide
example : isArticleSubLabel "第七十一条の五十四" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七十一条の五十四" := by native_decide
example : isArticleSubLabel "第七十一条の八" = true := by native_decide
example : isArticleSubLabel "第七十一条の八" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七十一条の八" := by native_decide
example : isArticleSubLabel "第七十一条の六" = true := by native_decide
example : isArticleSubLabel "第七十一条の六" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七十一条の六" := by native_decide
example : isArticleSubLabel "第七十一条の六十" = true := by native_decide
example : isArticleSubLabel "第七十一条の六十" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七十一条の六十" := by native_decide
example : isArticleSubLabel "第七十一条の六十一" = true := by native_decide
example : isArticleSubLabel "第七十一条の六十一" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七十一条の六十一" := by native_decide
example : isArticleSubLabel "第七十一条の六十七" = true := by native_decide
example : isArticleSubLabel "第七十一条の六十七" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七十一条の六十七" := by native_decide
example : isArticleSubLabel "第七十一条の六十三" = true := by native_decide
example : isArticleSubLabel "第七十一条の六十三" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七十一条の六十三" := by native_decide
example : isArticleSubLabel "第七十一条の六十二" = true := by native_decide
example : isArticleSubLabel "第七十一条の六十二" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七十一条の六十二" := by native_decide
example : isArticleSubLabel "第七十一条の十" = true := by native_decide
example : isArticleSubLabel "第七十一条の十" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七十一条の十" := by native_decide
example : isArticleSubLabel "第七十一条の十一" = true := by native_decide
example : isArticleSubLabel "第七十一条の十一" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七十一条の十一" := by native_decide
example : isArticleSubLabel "第七十一条の十七" = true := by native_decide
example : isArticleSubLabel "第七十一条の十七" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七十一条の十七" := by native_decide
example : isArticleSubLabel "第七十一条の十三" = true := by native_decide
example : isArticleSubLabel "第七十一条の十三" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七十一条の十三" := by native_decide
example : isArticleSubLabel "第七十一条の十九" = true := by native_decide
example : isArticleSubLabel "第七十一条の十九" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七十一条の十九" := by native_decide
example : isArticleSubLabel "第七十一条の十二" = true := by native_decide
example : isArticleSubLabel "第七十一条の十二" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七十一条の十二" := by native_decide
example : isArticleSubLabel "第七十一条の十五" = true := by native_decide
example : isArticleSubLabel "第七十一条の十五" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七十一条の十五" := by native_decide
example : isArticleSubLabel "第七十一条の十八" = true := by native_decide
example : isArticleSubLabel "第七十一条の十八" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七十一条の十八" := by native_decide
example : isArticleSubLabel "第七十一条の十六" = true := by native_decide
example : isArticleSubLabel "第七十一条の十六" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七十一条の十六" := by native_decide
example : isArticleSubLabel "第七十一条の十四" = true := by native_decide
example : isArticleSubLabel "第七十一条の十四" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七十一条の十四" := by native_decide
example : isArticleSubLabel "第七十一条の四" = true := by native_decide
example : isArticleSubLabel "第七十一条の四" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七十一条の四" := by native_decide
example : isArticleSubLabel "第七十一条の四十" = true := by native_decide
example : isArticleSubLabel "第七十一条の四十" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七十一条の四十" := by native_decide
example : isArticleSubLabel "第七十一条の四十一" = true := by native_decide
example : isArticleSubLabel "第七十一条の四十一" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七十一条の四十一" := by native_decide
example : isArticleSubLabel "第七十一条の四十七" = true := by native_decide
example : isArticleSubLabel "第七十一条の四十七" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七十一条の四十七" := by native_decide
example : isArticleSubLabel "第七十一条の四十三" = true := by native_decide
example : isArticleSubLabel "第七十一条の四十三" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七十一条の四十三" := by native_decide
example : isArticleSubLabel "第七十一条の四十九" = true := by native_decide
example : isArticleSubLabel "第七十一条の四十九" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七十一条の四十九" := by native_decide
example : isArticleSubLabel "第七十一条の四十二" = true := by native_decide
example : isArticleSubLabel "第七十一条の四十二" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七十一条の四十二" := by native_decide
example : isArticleSubLabel "第七十一条の四十八" = true := by native_decide
example : isArticleSubLabel "第七十一条の四十八" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七十一条の四十八" := by native_decide
example : isArticleSubLabel "第七十七条の七" = true := by native_decide
example : isArticleSubLabel "第七十七条の七" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七十七条の七" := by native_decide
example : isArticleSubLabel "第七十七条の五" = true := by native_decide
example : isArticleSubLabel "第七十七条の五" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七十七条の五" := by native_decide
example : isArticleSubLabel "第七十七条の六" = true := by native_decide
example : isArticleSubLabel "第七十七条の六" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七十七条の六" := by native_decide
example : isArticleSubLabel "第七十七条の四" = true := by native_decide
example : isArticleSubLabel "第七十七条の四" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七十七条の四" := by native_decide
example : isArticleSubLabel "第七十三条の七" = true := by native_decide
example : isArticleSubLabel "第七十三条の七" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七十三条の七" := by native_decide
example : isArticleSubLabel "第七十三条の九" = true := by native_decide
example : isArticleSubLabel "第七十三条の九" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七十三条の九" := by native_decide
example : isArticleSubLabel "第七十三条の五" = true := by native_decide
example : isArticleSubLabel "第七十三条の五" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七十三条の五" := by native_decide
example : isArticleSubLabel "第七十三条の八" = true := by native_decide
example : isArticleSubLabel "第七十三条の八" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七十三条の八" := by native_decide
example : isArticleSubLabel "第七十三条の六" = true := by native_decide
example : isArticleSubLabel "第七十三条の六" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七十三条の六" := by native_decide
example : isArticleSubLabel "第七十三条の十" = true := by native_decide
example : isArticleSubLabel "第七十三条の十" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七十三条の十" := by native_decide
example : isArticleSubLabel "第七十三条の十一" = true := by native_decide
example : isArticleSubLabel "第七十三条の十一" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七十三条の十一" := by native_decide
example : isArticleSubLabel "第七十三条の十七" = true := by native_decide
example : isArticleSubLabel "第七十三条の十七" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七十三条の十七" := by native_decide
example : isArticleSubLabel "第七十三条の十三" = true := by native_decide
example : isArticleSubLabel "第七十三条の十三" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七十三条の十三" := by native_decide
example : isArticleSubLabel "第七十三条の十九" = true := by native_decide
example : isArticleSubLabel "第七十三条の十九" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七十三条の十九" := by native_decide
example : isArticleSubLabel "第七十三条の十二" = true := by native_decide
example : isArticleSubLabel "第七十三条の十二" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七十三条の十二" := by native_decide
example : isArticleSubLabel "第七十三条の十五" = true := by native_decide
example : isArticleSubLabel "第七十三条の十五" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七十三条の十五" := by native_decide
example : isArticleSubLabel "第七十三条の十八" = true := by native_decide
example : isArticleSubLabel "第七十三条の十八" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七十三条の十八" := by native_decide
example : isArticleSubLabel "第七十三条の十六" = true := by native_decide
example : isArticleSubLabel "第七十三条の十六" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七十三条の十六" := by native_decide
example : isArticleSubLabel "第七十三条の十四" = true := by native_decide
example : isArticleSubLabel "第七十三条の十四" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七十三条の十四" := by native_decide
example : isArticleSubLabel "第七十三条の四" = true := by native_decide
example : isArticleSubLabel "第七十三条の四" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七十三条の四" := by native_decide
example : isArticleSubLabel "第七十九条の五" = true := by native_decide
example : isArticleSubLabel "第七十九条の五" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七十九条の五" := by native_decide
example : isArticleSubLabel "第七十九条の六" = true := by native_decide
example : isArticleSubLabel "第七十九条の六" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七十九条の六" := by native_decide
example : isArticleSubLabel "第七十九条の四" = true := by native_decide
example : isArticleSubLabel "第七十九条の四" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七十九条の四" := by native_decide
example : isArticleSubLabel "第七十二条の七" = true := by native_decide
example : isArticleSubLabel "第七十二条の七" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七十二条の七" := by native_decide
example : isArticleSubLabel "第七十二条の七十" = true := by native_decide
example : isArticleSubLabel "第七十二条の七十" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七十二条の七十" := by native_decide
example : isArticleSubLabel "第七十二条の七十一" = true := by native_decide
example : isArticleSubLabel "第七十二条の七十一" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七十二条の七十一" := by native_decide
example : isArticleSubLabel "第七十二条の七十七" = true := by native_decide
example : isArticleSubLabel "第七十二条の七十七" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七十二条の七十七" := by native_decide
example : isArticleSubLabel "第七十二条の七十九" = true := by native_decide
example : isArticleSubLabel "第七十二条の七十九" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七十二条の七十九" := by native_decide
example : isArticleSubLabel "第七十二条の七十八" = true := by native_decide
example : isArticleSubLabel "第七十二条の七十八" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七十二条の七十八" := by native_decide
example : isArticleSubLabel "第七十二条の七十六" = true := by native_decide
example : isArticleSubLabel "第七十二条の七十六" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七十二条の七十六" := by native_decide
example : isArticleSubLabel "第七十二条の九" = true := by native_decide
example : isArticleSubLabel "第七十二条の九" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七十二条の九" := by native_decide
example : isArticleSubLabel "第七十二条の九十" = true := by native_decide
example : isArticleSubLabel "第七十二条の九十" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七十二条の九十" := by native_decide
example : isArticleSubLabel "第七十二条の九十一" = true := by native_decide
example : isArticleSubLabel "第七十二条の九十一" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七十二条の九十一" := by native_decide
example : isArticleSubLabel "第七十二条の九十三" = true := by native_decide
example : isArticleSubLabel "第七十二条の九十三" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七十二条の九十三" := by native_decide
example : isArticleSubLabel "第七十二条の九十二" = true := by native_decide
example : isArticleSubLabel "第七十二条の九十二" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七十二条の九十二" := by native_decide
example : isArticleSubLabel "第七十二条の九十五" = true := by native_decide
example : isArticleSubLabel "第七十二条の九十五" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七十二条の九十五" := by native_decide
example : isArticleSubLabel "第七十二条の九十四" = true := by native_decide
example : isArticleSubLabel "第七十二条の九十四" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七十二条の九十四" := by native_decide
example : isArticleSubLabel "第七十二条の五" = true := by native_decide
example : isArticleSubLabel "第七十二条の五" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七十二条の五" := by native_decide
example : isArticleSubLabel "第七十二条の五十" = true := by native_decide
example : isArticleSubLabel "第七十二条の五十" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七十二条の五十" := by native_decide
example : isArticleSubLabel "第七十二条の五十一" = true := by native_decide
example : isArticleSubLabel "第七十二条の五十一" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七十二条の五十一" := by native_decide
example : isArticleSubLabel "第七十二条の五十七" = true := by native_decide
example : isArticleSubLabel "第七十二条の五十七" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七十二条の五十七" := by native_decide
example : isArticleSubLabel "第七十二条の五十三" = true := by native_decide
example : isArticleSubLabel "第七十二条の五十三" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七十二条の五十三" := by native_decide
example : isArticleSubLabel "第七十二条の五十九" = true := by native_decide
example : isArticleSubLabel "第七十二条の五十九" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七十二条の五十九" := by native_decide
example : isArticleSubLabel "第七十二条の五十二" = true := by native_decide
example : isArticleSubLabel "第七十二条の五十二" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七十二条の五十二" := by native_decide
example : isArticleSubLabel "第七十二条の五十五" = true := by native_decide
example : isArticleSubLabel "第七十二条の五十五" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七十二条の五十五" := by native_decide
example : isArticleSubLabel "第七十二条の五十八" = true := by native_decide
example : isArticleSubLabel "第七十二条の五十八" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七十二条の五十八" := by native_decide
example : isArticleSubLabel "第七十二条の五十六" = true := by native_decide
example : isArticleSubLabel "第七十二条の五十六" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七十二条の五十六" := by native_decide
example : isArticleSubLabel "第七十二条の五十四" = true := by native_decide
example : isArticleSubLabel "第七十二条の五十四" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七十二条の五十四" := by native_decide
example : isArticleSubLabel "第七十二条の八" = true := by native_decide
example : isArticleSubLabel "第七十二条の八" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七十二条の八" := by native_decide
example : isArticleSubLabel "第七十二条の八十" = true := by native_decide
example : isArticleSubLabel "第七十二条の八十" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七十二条の八十" := by native_decide
example : isArticleSubLabel "第七十二条の八十一" = true := by native_decide
example : isArticleSubLabel "第七十二条の八十一" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七十二条の八十一" := by native_decide
example : isArticleSubLabel "第七十二条の八十七" = true := by native_decide
example : isArticleSubLabel "第七十二条の八十七" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七十二条の八十七" := by native_decide
example : isArticleSubLabel "第七十二条の八十三" = true := by native_decide
example : isArticleSubLabel "第七十二条の八十三" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七十二条の八十三" := by native_decide
example : isArticleSubLabel "第七十二条の八十九" = true := by native_decide
example : isArticleSubLabel "第七十二条の八十九" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七十二条の八十九" := by native_decide
example : isArticleSubLabel "第七十二条の八十二" = true := by native_decide
example : isArticleSubLabel "第七十二条の八十二" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七十二条の八十二" := by native_decide
example : isArticleSubLabel "第七十二条の八十五" = true := by native_decide
example : isArticleSubLabel "第七十二条の八十五" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七十二条の八十五" := by native_decide
example : isArticleSubLabel "第七十二条の八十八" = true := by native_decide
example : isArticleSubLabel "第七十二条の八十八" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七十二条の八十八" := by native_decide
example : isArticleSubLabel "第七十二条の八十六" = true := by native_decide
example : isArticleSubLabel "第七十二条の八十六" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七十二条の八十六" := by native_decide
example : isArticleSubLabel "第七十二条の八十四" = true := by native_decide
example : isArticleSubLabel "第七十二条の八十四" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七十二条の八十四" := by native_decide
example : isArticleSubLabel "第七十二条の六" = true := by native_decide
example : isArticleSubLabel "第七十二条の六" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七十二条の六" := by native_decide
example : isArticleSubLabel "第七十二条の六十" = true := by native_decide
example : isArticleSubLabel "第七十二条の六十" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七十二条の六十" := by native_decide
example : isArticleSubLabel "第七十二条の六十一" = true := by native_decide
example : isArticleSubLabel "第七十二条の六十一" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七十二条の六十一" := by native_decide
example : isArticleSubLabel "第七十二条の六十七" = true := by native_decide
example : isArticleSubLabel "第七十二条の六十七" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七十二条の六十七" := by native_decide
example : isArticleSubLabel "第七十二条の六十三" = true := by native_decide
example : isArticleSubLabel "第七十二条の六十三" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七十二条の六十三" := by native_decide
example : isArticleSubLabel "第七十二条の六十九" = true := by native_decide
example : isArticleSubLabel "第七十二条の六十九" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七十二条の六十九" := by native_decide
example : isArticleSubLabel "第七十二条の六十二" = true := by native_decide
example : isArticleSubLabel "第七十二条の六十二" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七十二条の六十二" := by native_decide
example : isArticleSubLabel "第七十二条の六十五" = true := by native_decide
example : isArticleSubLabel "第七十二条の六十五" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七十二条の六十五" := by native_decide
example : isArticleSubLabel "第七十二条の六十八" = true := by native_decide
example : isArticleSubLabel "第七十二条の六十八" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七十二条の六十八" := by native_decide
example : isArticleSubLabel "第七十二条の六十六" = true := by native_decide
example : isArticleSubLabel "第七十二条の六十六" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七十二条の六十六" := by native_decide
example : isArticleSubLabel "第七十二条の六十四" = true := by native_decide
example : isArticleSubLabel "第七十二条の六十四" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七十二条の六十四" := by native_decide
example : isArticleSubLabel "第七十二条の十" = true := by native_decide
example : isArticleSubLabel "第七十二条の十" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七十二条の十" := by native_decide
example : isArticleSubLabel "第七十二条の十一" = true := by native_decide
example : isArticleSubLabel "第七十二条の十一" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七十二条の十一" := by native_decide
example : isArticleSubLabel "第七十二条の十七" = true := by native_decide
example : isArticleSubLabel "第七十二条の十七" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七十二条の十七" := by native_decide
example : isArticleSubLabel "第七十二条の十三" = true := by native_decide
example : isArticleSubLabel "第七十二条の十三" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七十二条の十三" := by native_decide
example : isArticleSubLabel "第七十二条の十九" = true := by native_decide
example : isArticleSubLabel "第七十二条の十九" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七十二条の十九" := by native_decide
example : isArticleSubLabel "第七十二条の十二" = true := by native_decide
example : isArticleSubLabel "第七十二条の十二" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七十二条の十二" := by native_decide
example : isArticleSubLabel "第七十二条の十五" = true := by native_decide
example : isArticleSubLabel "第七十二条の十五" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七十二条の十五" := by native_decide
example : isArticleSubLabel "第七十二条の十八" = true := by native_decide
example : isArticleSubLabel "第七十二条の十八" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七十二条の十八" := by native_decide
example : isArticleSubLabel "第七十二条の十六" = true := by native_decide
example : isArticleSubLabel "第七十二条の十六" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七十二条の十六" := by native_decide
example : isArticleSubLabel "第七十二条の十四" = true := by native_decide
example : isArticleSubLabel "第七十二条の十四" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七十二条の十四" := by native_decide
example : isArticleSubLabel "第七十二条の四" = true := by native_decide
example : isArticleSubLabel "第七十二条の四" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七十二条の四" := by native_decide
example : isArticleSubLabel "第七十二条の四十" = true := by native_decide
example : isArticleSubLabel "第七十二条の四十" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七十二条の四十" := by native_decide
example : isArticleSubLabel "第七十二条の四十一" = true := by native_decide
example : isArticleSubLabel "第七十二条の四十一" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七十二条の四十一" := by native_decide
example : isArticleSubLabel "第七十二条の四十七" = true := by native_decide
example : isArticleSubLabel "第七十二条の四十七" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七十二条の四十七" := by native_decide
example : isArticleSubLabel "第七十二条の四十三" = true := by native_decide
example : isArticleSubLabel "第七十二条の四十三" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七十二条の四十三" := by native_decide
example : isArticleSubLabel "第七十二条の四十九" = true := by native_decide
example : isArticleSubLabel "第七十二条の四十九" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七十二条の四十九" := by native_decide
example : isArticleSubLabel "第七十二条の四十二" = true := by native_decide
example : isArticleSubLabel "第七十二条の四十二" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七十二条の四十二" := by native_decide
example : isArticleSubLabel "第七十二条の四十五" = true := by native_decide
example : isArticleSubLabel "第七十二条の四十五" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七十二条の四十五" := by native_decide
example : isArticleSubLabel "第七十二条の四十八" = true := by native_decide
example : isArticleSubLabel "第七十二条の四十八" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七十二条の四十八" := by native_decide
example : isArticleSubLabel "第七十二条の四十六" = true := by native_decide
example : isArticleSubLabel "第七十二条の四十六" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七十二条の四十六" := by native_decide
example : isArticleSubLabel "第七十二条の四十四" = true := by native_decide
example : isArticleSubLabel "第七十二条の四十四" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七十二条の四十四" := by native_decide
example : isArticleSubLabel "第七十二条の百" = true := by native_decide
example : isArticleSubLabel "第七十二条の百" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七十二条の百" := by native_decide
example : isArticleSubLabel "第七十二条の百一" = true := by native_decide
example : isArticleSubLabel "第七十二条の百一" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七十二条の百一" := by native_decide
example : isArticleSubLabel "第七十二条の百七" = true := by native_decide
example : isArticleSubLabel "第七十二条の百七" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七十二条の百七" := by native_decide
example : isArticleSubLabel "第七十二条の百三" = true := by native_decide
example : isArticleSubLabel "第七十二条の百三" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七十二条の百三" := by native_decide
example : isArticleSubLabel "第七十二条の百九" = true := by native_decide
example : isArticleSubLabel "第七十二条の百九" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七十二条の百九" := by native_decide
example : isArticleSubLabel "第七十二条の百二" = true := by native_decide
example : isArticleSubLabel "第七十二条の百二" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七十二条の百二" := by native_decide
example : isArticleSubLabel "第七十二条の百五" = true := by native_decide
example : isArticleSubLabel "第七十二条の百五" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七十二条の百五" := by native_decide
example : isArticleSubLabel "第七十二条の百八" = true := by native_decide
example : isArticleSubLabel "第七十二条の百八" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七十二条の百八" := by native_decide
example : isArticleSubLabel "第七十二条の百六" = true := by native_decide
example : isArticleSubLabel "第七十二条の百六" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七十二条の百六" := by native_decide
example : isArticleSubLabel "第七十二条の百十" = true := by native_decide
example : isArticleSubLabel "第七十二条の百十" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七十二条の百十" := by native_decide
example : isArticleSubLabel "第七十二条の百十一" = true := by native_decide
example : isArticleSubLabel "第七十二条の百十一" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七十二条の百十一" := by native_decide
example : isArticleSubLabel "第七十二条の百十七" = true := by native_decide
example : isArticleSubLabel "第七十二条の百十七" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七十二条の百十七" := by native_decide
example : isArticleSubLabel "第七十二条の百十三" = true := by native_decide
example : isArticleSubLabel "第七十二条の百十三" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七十二条の百十三" := by native_decide
example : isArticleSubLabel "第七十二条の百十二" = true := by native_decide
example : isArticleSubLabel "第七十二条の百十二" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七十二条の百十二" := by native_decide
example : isArticleSubLabel "第七十二条の百十五" = true := by native_decide
example : isArticleSubLabel "第七十二条の百十五" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七十二条の百十五" := by native_decide
example : isArticleSubLabel "第七十二条の百十六" = true := by native_decide
example : isArticleSubLabel "第七十二条の百十六" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七十二条の百十六" := by native_decide
example : isArticleSubLabel "第七十二条の百十四" = true := by native_decide
example : isArticleSubLabel "第七十二条の百十四" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七十二条の百十四" := by native_decide
example : isArticleSubLabel "第七十二条の百四" = true := by native_decide
example : isArticleSubLabel "第七十二条の百四" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七十二条の百四" := by native_decide
example : isArticleSubLabel "第七十五条の五" = true := by native_decide
example : isArticleSubLabel "第七十五条の五" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七十五条の五" := by native_decide
example : isArticleSubLabel "第七十五条の四" = true := by native_decide
example : isArticleSubLabel "第七十五条の四" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七十五条の四" := by native_decide
example : isArticleSubLabel "第七十四条の七" = true := by native_decide
example : isArticleSubLabel "第七十四条の七" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七十四条の七" := by native_decide
example : isArticleSubLabel "第七十四条の九" = true := by native_decide
example : isArticleSubLabel "第七十四条の九" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七十四条の九" := by native_decide
example : isArticleSubLabel "第七十四条の五" = true := by native_decide
example : isArticleSubLabel "第七十四条の五" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七十四条の五" := by native_decide
example : isArticleSubLabel "第七十四条の八" = true := by native_decide
example : isArticleSubLabel "第七十四条の八" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七十四条の八" := by native_decide
example : isArticleSubLabel "第七十四条の六" = true := by native_decide
example : isArticleSubLabel "第七十四条の六" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七十四条の六" := by native_decide
example : isArticleSubLabel "第七十四条の十" = true := by native_decide
example : isArticleSubLabel "第七十四条の十" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七十四条の十" := by native_decide
example : isArticleSubLabel "第七十四条の十一" = true := by native_decide
example : isArticleSubLabel "第七十四条の十一" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七十四条の十一" := by native_decide
example : isArticleSubLabel "第七十四条の十七" = true := by native_decide
example : isArticleSubLabel "第七十四条の十七" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七十四条の十七" := by native_decide
example : isArticleSubLabel "第七十四条の十三" = true := by native_decide
example : isArticleSubLabel "第七十四条の十三" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七十四条の十三" := by native_decide
example : isArticleSubLabel "第七十四条の十九" = true := by native_decide
example : isArticleSubLabel "第七十四条の十九" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七十四条の十九" := by native_decide
example : isArticleSubLabel "第七十四条の十二" = true := by native_decide
example : isArticleSubLabel "第七十四条の十二" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七十四条の十二" := by native_decide
example : isArticleSubLabel "第七十四条の十五" = true := by native_decide
example : isArticleSubLabel "第七十四条の十五" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七十四条の十五" := by native_decide
example : isArticleSubLabel "第七十四条の十八" = true := by native_decide
example : isArticleSubLabel "第七十四条の十八" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七十四条の十八" := by native_decide
example : isArticleSubLabel "第七十四条の十六" = true := by native_decide
example : isArticleSubLabel "第七十四条の十六" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七十四条の十六" := by native_decide
example : isArticleSubLabel "第七十四条の十四" = true := by native_decide
example : isArticleSubLabel "第七十四条の十四" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七十四条の十四" := by native_decide
example : isArticleSubLabel "第七十四条の四" = true := by native_decide
example : isArticleSubLabel "第七十四条の四" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七十四条の四" := by native_decide
example : isArticleSubLabel "第七十条の七" = true := by native_decide
example : isArticleSubLabel "第七十条の七" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七十条の七" := by native_decide
example : isArticleSubLabel "第七十条の九" = true := by native_decide
example : isArticleSubLabel "第七十条の九" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七十条の九" := by native_decide
example : isArticleSubLabel "第七十条の五" = true := by native_decide
example : isArticleSubLabel "第七十条の五" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七十条の五" := by native_decide
example : isArticleSubLabel "第七十条の八" = true := by native_decide
example : isArticleSubLabel "第七十条の八" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七十条の八" := by native_decide
example : isArticleSubLabel "第七十条の六" = true := by native_decide
example : isArticleSubLabel "第七十条の六" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七十条の六" := by native_decide
example : isArticleSubLabel "第七十条の十" = true := by native_decide
example : isArticleSubLabel "第七十条の十" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七十条の十" := by native_decide
example : isArticleSubLabel "第七十条の十一" = true := by native_decide
example : isArticleSubLabel "第七十条の十一" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七十条の十一" := by native_decide
example : isArticleSubLabel "第七十条の十三" = true := by native_decide
example : isArticleSubLabel "第七十条の十三" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七十条の十三" := by native_decide
example : isArticleSubLabel "第七十条の十二" = true := by native_decide
example : isArticleSubLabel "第七十条の十二" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七十条の十二" := by native_decide
example : isArticleSubLabel "第七十条の十四" = true := by native_decide
example : isArticleSubLabel "第七十条の十四" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七十条の十四" := by native_decide
example : isArticleSubLabel "第七十条の四" = true := by native_decide
example : isArticleSubLabel "第七十条の四" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七十条の四" := by native_decide
example : isArticleSubLabel "第七条の七" = true := by native_decide
example : isArticleSubLabel "第七条の七" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七条の七" := by native_decide
example : isArticleSubLabel "第七条の九" = true := by native_decide
example : isArticleSubLabel "第七条の九" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七条の九" := by native_decide
example : isArticleSubLabel "第七条の五" = true := by native_decide
example : isArticleSubLabel "第七条の五" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七条の五" := by native_decide
example : isArticleSubLabel "第七条の八" = true := by native_decide
example : isArticleSubLabel "第七条の八" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七条の八" := by native_decide
example : isArticleSubLabel "第七条の六" = true := by native_decide
example : isArticleSubLabel "第七条の六" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七条の六" := by native_decide
example : isArticleSubLabel "第七条の十" = true := by native_decide
example : isArticleSubLabel "第七条の十" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七条の十" := by native_decide
example : isArticleSubLabel "第七条の十一" = true := by native_decide
example : isArticleSubLabel "第七条の十一" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七条の十一" := by native_decide
example : isArticleSubLabel "第七条の十七" = true := by native_decide
example : isArticleSubLabel "第七条の十七" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七条の十七" := by native_decide
example : isArticleSubLabel "第七条の十三" = true := by native_decide
example : isArticleSubLabel "第七条の十三" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七条の十三" := by native_decide
example : isArticleSubLabel "第七条の十九" = true := by native_decide
example : isArticleSubLabel "第七条の十九" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七条の十九" := by native_decide
example : isArticleSubLabel "第七条の十二" = true := by native_decide
example : isArticleSubLabel "第七条の十二" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七条の十二" := by native_decide
example : isArticleSubLabel "第七条の十五" = true := by native_decide
example : isArticleSubLabel "第七条の十五" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七条の十五" := by native_decide
example : isArticleSubLabel "第七条の十八" = true := by native_decide
example : isArticleSubLabel "第七条の十八" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七条の十八" := by native_decide
example : isArticleSubLabel "第七条の十六" = true := by native_decide
example : isArticleSubLabel "第七条の十六" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七条の十六" := by native_decide
example : isArticleSubLabel "第七条の十四" = true := by native_decide
example : isArticleSubLabel "第七条の十四" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七条の十四" := by native_decide
example : isArticleSubLabel "第七条の四" = true := by native_decide
example : isArticleSubLabel "第七条の四" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七条の四" := by native_decide
example : isArticleSubLabel "第七百一条の七" = true := by native_decide
example : isArticleSubLabel "第七百一条の七" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七百一条の七" := by native_decide
example : isArticleSubLabel "第七百一条の七十三" = true := by native_decide
example : isArticleSubLabel "第七百一条の七十三" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七百一条の七十三" := by native_decide
example : isArticleSubLabel "第七百一条の七十四" = true := by native_decide
example : isArticleSubLabel "第七百一条の七十四" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七百一条の七十四" := by native_decide
example : isArticleSubLabel "第七百一条の九" = true := by native_decide
example : isArticleSubLabel "第七百一条の九" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七百一条の九" := by native_decide
example : isArticleSubLabel "第七百一条の五" = true := by native_decide
example : isArticleSubLabel "第七百一条の五" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七百一条の五" := by native_decide
example : isArticleSubLabel "第七百一条の五十七" = true := by native_decide
example : isArticleSubLabel "第七百一条の五十七" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七百一条の五十七" := by native_decide
example : isArticleSubLabel "第七百一条の五十三" = true := by native_decide
example : isArticleSubLabel "第七百一条の五十三" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七百一条の五十三" := by native_decide
example : isArticleSubLabel "第七百一条の五十九" = true := by native_decide
example : isArticleSubLabel "第七百一条の五十九" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七百一条の五十九" := by native_decide
example : isArticleSubLabel "第七百一条の五十二" = true := by native_decide
example : isArticleSubLabel "第七百一条の五十二" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七百一条の五十二" := by native_decide
example : isArticleSubLabel "第七百一条の五十五" = true := by native_decide
example : isArticleSubLabel "第七百一条の五十五" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七百一条の五十五" := by native_decide
example : isArticleSubLabel "第七百一条の五十八" = true := by native_decide
example : isArticleSubLabel "第七百一条の五十八" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七百一条の五十八" := by native_decide
example : isArticleSubLabel "第七百一条の五十六" = true := by native_decide
example : isArticleSubLabel "第七百一条の五十六" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七百一条の五十六" := by native_decide
example : isArticleSubLabel "第七百一条の五十四" = true := by native_decide
example : isArticleSubLabel "第七百一条の五十四" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七百一条の五十四" := by native_decide
example : isArticleSubLabel "第七百一条の八" = true := by native_decide
example : isArticleSubLabel "第七百一条の八" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七百一条の八" := by native_decide
example : isArticleSubLabel "第七百一条の六" = true := by native_decide
example : isArticleSubLabel "第七百一条の六" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七百一条の六" := by native_decide
example : isArticleSubLabel "第七百一条の六十" = true := by native_decide
example : isArticleSubLabel "第七百一条の六十" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七百一条の六十" := by native_decide
example : isArticleSubLabel "第七百一条の六十一" = true := by native_decide
example : isArticleSubLabel "第七百一条の六十一" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七百一条の六十一" := by native_decide
example : isArticleSubLabel "第七百一条の六十七" = true := by native_decide
example : isArticleSubLabel "第七百一条の六十七" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七百一条の六十七" := by native_decide
example : isArticleSubLabel "第七百一条の六十三" = true := by native_decide
example : isArticleSubLabel "第七百一条の六十三" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七百一条の六十三" := by native_decide
example : isArticleSubLabel "第七百一条の六十二" = true := by native_decide
example : isArticleSubLabel "第七百一条の六十二" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七百一条の六十二" := by native_decide
example : isArticleSubLabel "第七百一条の六十五" = true := by native_decide
example : isArticleSubLabel "第七百一条の六十五" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七百一条の六十五" := by native_decide
example : isArticleSubLabel "第七百一条の六十八" = true := by native_decide
example : isArticleSubLabel "第七百一条の六十八" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七百一条の六十八" := by native_decide
example : isArticleSubLabel "第七百一条の六十六" = true := by native_decide
example : isArticleSubLabel "第七百一条の六十六" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七百一条の六十六" := by native_decide
example : isArticleSubLabel "第七百一条の六十四" = true := by native_decide
example : isArticleSubLabel "第七百一条の六十四" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七百一条の六十四" := by native_decide
example : isArticleSubLabel "第七百一条の十" = true := by native_decide
example : isArticleSubLabel "第七百一条の十" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七百一条の十" := by native_decide
example : isArticleSubLabel "第七百一条の十一" = true := by native_decide
example : isArticleSubLabel "第七百一条の十一" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七百一条の十一" := by native_decide
example : isArticleSubLabel "第七百一条の十七" = true := by native_decide
example : isArticleSubLabel "第七百一条の十七" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七百一条の十七" := by native_decide
example : isArticleSubLabel "第七百一条の十三" = true := by native_decide
example : isArticleSubLabel "第七百一条の十三" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七百一条の十三" := by native_decide
example : isArticleSubLabel "第七百一条の十九" = true := by native_decide
example : isArticleSubLabel "第七百一条の十九" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七百一条の十九" := by native_decide
example : isArticleSubLabel "第七百一条の十二" = true := by native_decide
example : isArticleSubLabel "第七百一条の十二" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七百一条の十二" := by native_decide
example : isArticleSubLabel "第七百一条の十五" = true := by native_decide
example : isArticleSubLabel "第七百一条の十五" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七百一条の十五" := by native_decide
example : isArticleSubLabel "第七百一条の十八" = true := by native_decide
example : isArticleSubLabel "第七百一条の十八" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七百一条の十八" := by native_decide
example : isArticleSubLabel "第七百一条の十六" = true := by native_decide
example : isArticleSubLabel "第七百一条の十六" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七百一条の十六" := by native_decide
example : isArticleSubLabel "第七百一条の十四" = true := by native_decide
example : isArticleSubLabel "第七百一条の十四" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七百一条の十四" := by native_decide
example : isArticleSubLabel "第七百一条の四" = true := by native_decide
example : isArticleSubLabel "第七百一条の四" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七百一条の四" := by native_decide
example : isArticleSubLabel "第七百一条の四十" = true := by native_decide
example : isArticleSubLabel "第七百一条の四十" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七百一条の四十" := by native_decide
example : isArticleSubLabel "第七百一条の四十一" = true := by native_decide
example : isArticleSubLabel "第七百一条の四十一" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七百一条の四十一" := by native_decide
example : isArticleSubLabel "第七百一条の四十七" = true := by native_decide
example : isArticleSubLabel "第七百一条の四十七" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七百一条の四十七" := by native_decide
example : isArticleSubLabel "第七百一条の四十三" = true := by native_decide
example : isArticleSubLabel "第七百一条の四十三" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七百一条の四十三" := by native_decide
example : isArticleSubLabel "第七百一条の四十九" = true := by native_decide
example : isArticleSubLabel "第七百一条の四十九" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七百一条の四十九" := by native_decide
example : isArticleSubLabel "第七百一条の四十二" = true := by native_decide
example : isArticleSubLabel "第七百一条の四十二" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七百一条の四十二" := by native_decide
example : isArticleSubLabel "第七百一条の四十五" = true := by native_decide
example : isArticleSubLabel "第七百一条の四十五" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七百一条の四十五" := by native_decide
example : isArticleSubLabel "第七百一条の四十八" = true := by native_decide
example : isArticleSubLabel "第七百一条の四十八" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七百一条の四十八" := by native_decide
example : isArticleSubLabel "第七百一条の四十六" = true := by native_decide
example : isArticleSubLabel "第七百一条の四十六" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七百一条の四十六" := by native_decide
example : isArticleSubLabel "第七百一条の四十四" = true := by native_decide
example : isArticleSubLabel "第七百一条の四十四" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七百一条の四十四" := by native_decide
example : isArticleSubLabel "第七百三十三条の七" = true := by native_decide
example : isArticleSubLabel "第七百三十三条の七" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七百三十三条の七" := by native_decide
example : isArticleSubLabel "第七百三十三条の九" = true := by native_decide
example : isArticleSubLabel "第七百三十三条の九" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七百三十三条の九" := by native_decide
example : isArticleSubLabel "第七百三十三条の五" = true := by native_decide
example : isArticleSubLabel "第七百三十三条の五" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七百三十三条の五" := by native_decide
example : isArticleSubLabel "第七百三十三条の八" = true := by native_decide
example : isArticleSubLabel "第七百三十三条の八" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七百三十三条の八" := by native_decide
example : isArticleSubLabel "第七百三十三条の六" = true := by native_decide
example : isArticleSubLabel "第七百三十三条の六" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七百三十三条の六" := by native_decide
example : isArticleSubLabel "第七百三十三条の十" = true := by native_decide
example : isArticleSubLabel "第七百三十三条の十" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七百三十三条の十" := by native_decide
example : isArticleSubLabel "第七百三十三条の十一" = true := by native_decide
example : isArticleSubLabel "第七百三十三条の十一" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七百三十三条の十一" := by native_decide
example : isArticleSubLabel "第七百三十三条の十七" = true := by native_decide
example : isArticleSubLabel "第七百三十三条の十七" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七百三十三条の十七" := by native_decide
example : isArticleSubLabel "第七百三十三条の十三" = true := by native_decide
example : isArticleSubLabel "第七百三十三条の十三" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七百三十三条の十三" := by native_decide
example : isArticleSubLabel "第七百三十三条の十九" = true := by native_decide
example : isArticleSubLabel "第七百三十三条の十九" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七百三十三条の十九" := by native_decide
example : isArticleSubLabel "第七百三十三条の十二" = true := by native_decide
example : isArticleSubLabel "第七百三十三条の十二" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七百三十三条の十二" := by native_decide
example : isArticleSubLabel "第七百三十三条の十五" = true := by native_decide
example : isArticleSubLabel "第七百三十三条の十五" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七百三十三条の十五" := by native_decide
example : isArticleSubLabel "第七百三十三条の十八" = true := by native_decide
example : isArticleSubLabel "第七百三十三条の十八" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七百三十三条の十八" := by native_decide
example : isArticleSubLabel "第七百三十三条の十六" = true := by native_decide
example : isArticleSubLabel "第七百三十三条の十六" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七百三十三条の十六" := by native_decide
example : isArticleSubLabel "第七百三十三条の十四" = true := by native_decide
example : isArticleSubLabel "第七百三十三条の十四" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七百三十三条の十四" := by native_decide
example : isArticleSubLabel "第七百三十三条の四" = true := by native_decide
example : isArticleSubLabel "第七百三十三条の四" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七百三十三条の四" := by native_decide
example : isArticleSubLabel "第七百三十九条の五" = true := by native_decide
example : isArticleSubLabel "第七百三十九条の五" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七百三十九条の五" := by native_decide
example : isArticleSubLabel "第七百三十九条の六" = true := by native_decide
example : isArticleSubLabel "第七百三十九条の六" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七百三十九条の六" := by native_decide
example : isArticleSubLabel "第七百三十九条の四" = true := by native_decide
example : isArticleSubLabel "第七百三十九条の四" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七百三十九条の四" := by native_decide
example : isArticleSubLabel "第七百三条の五" = true := by native_decide
example : isArticleSubLabel "第七百三条の五" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七百三条の五" := by native_decide
example : isArticleSubLabel "第七百三条の四" = true := by native_decide
example : isArticleSubLabel "第七百三条の四" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七百三条の四" := by native_decide
example : isArticleSubLabel "第七百二条の七" = true := by native_decide
example : isArticleSubLabel "第七百二条の七" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七百二条の七" := by native_decide
example : isArticleSubLabel "第七百二条の五" = true := by native_decide
example : isArticleSubLabel "第七百二条の五" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七百二条の五" := by native_decide
example : isArticleSubLabel "第七百二条の八" = true := by native_decide
example : isArticleSubLabel "第七百二条の八" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七百二条の八" := by native_decide
example : isArticleSubLabel "第七百二条の六" = true := by native_decide
example : isArticleSubLabel "第七百二条の六" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七百二条の六" := by native_decide
example : isArticleSubLabel "第七百二条の四" = true := by native_decide
example : isArticleSubLabel "第七百二条の四" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七百二条の四" := by native_decide
example : isArticleSubLabel "第七百十八条の七" = true := by native_decide
example : isArticleSubLabel "第七百十八条の七" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七百十八条の七" := by native_decide
example : isArticleSubLabel "第七百十八条の九" = true := by native_decide
example : isArticleSubLabel "第七百十八条の九" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七百十八条の九" := by native_decide
example : isArticleSubLabel "第七百十八条の五" = true := by native_decide
example : isArticleSubLabel "第七百十八条の五" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七百十八条の五" := by native_decide
example : isArticleSubLabel "第七百十八条の八" = true := by native_decide
example : isArticleSubLabel "第七百十八条の八" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七百十八条の八" := by native_decide
example : isArticleSubLabel "第七百十八条の六" = true := by native_decide
example : isArticleSubLabel "第七百十八条の六" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七百十八条の六" := by native_decide
example : isArticleSubLabel "第七百十八条の十" = true := by native_decide
example : isArticleSubLabel "第七百十八条の十" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七百十八条の十" := by native_decide
example : isArticleSubLabel "第七百十八条の十一" = true := by native_decide
example : isArticleSubLabel "第七百十八条の十一" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七百十八条の十一" := by native_decide
example : isArticleSubLabel "第七百十八条の四" = true := by native_decide
example : isArticleSubLabel "第七百十八条の四" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七百十八条の四" := by native_decide
example : isArticleSubLabel "第七百四十七条の七" = true := by native_decide
example : isArticleSubLabel "第七百四十七条の七" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七百四十七条の七" := by native_decide
example : isArticleSubLabel "第七百四十七条の九" = true := by native_decide
example : isArticleSubLabel "第七百四十七条の九" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七百四十七条の九" := by native_decide
example : isArticleSubLabel "第七百四十七条の五" = true := by native_decide
example : isArticleSubLabel "第七百四十七条の五" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七百四十七条の五" := by native_decide
example : isArticleSubLabel "第七百四十七条の八" = true := by native_decide
example : isArticleSubLabel "第七百四十七条の八" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七百四十七条の八" := by native_decide
example : isArticleSubLabel "第七百四十七条の六" = true := by native_decide
example : isArticleSubLabel "第七百四十七条の六" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七百四十七条の六" := by native_decide
example : isArticleSubLabel "第七百四十七条の十" = true := by native_decide
example : isArticleSubLabel "第七百四十七条の十" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七百四十七条の十" := by native_decide
example : isArticleSubLabel "第七百四十七条の十一" = true := by native_decide
example : isArticleSubLabel "第七百四十七条の十一" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七百四十七条の十一" := by native_decide
example : isArticleSubLabel "第七百四十七条の十三" = true := by native_decide
example : isArticleSubLabel "第七百四十七条の十三" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七百四十七条の十三" := by native_decide
example : isArticleSubLabel "第七百四十七条の十二" = true := by native_decide
example : isArticleSubLabel "第七百四十七条の十二" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七百四十七条の十二" := by native_decide
example : isArticleSubLabel "第七百四十七条の四" = true := by native_decide
example : isArticleSubLabel "第七百四十七条の四" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七百四十七条の四" := by native_decide
example : isArticleSubLabel "第七百条の五十一" = true := by native_decide
example : isArticleSubLabel "第七百条の五十一" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七百条の五十一" := by native_decide
example : isArticleSubLabel "第七百条の五十七" = true := by native_decide
example : isArticleSubLabel "第七百条の五十七" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七百条の五十七" := by native_decide
example : isArticleSubLabel "第七百条の五十三" = true := by native_decide
example : isArticleSubLabel "第七百条の五十三" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七百条の五十三" := by native_decide
example : isArticleSubLabel "第七百条の五十九" = true := by native_decide
example : isArticleSubLabel "第七百条の五十九" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七百条の五十九" := by native_decide
example : isArticleSubLabel "第七百条の五十二" = true := by native_decide
example : isArticleSubLabel "第七百条の五十二" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七百条の五十二" := by native_decide
example : isArticleSubLabel "第七百条の五十五" = true := by native_decide
example : isArticleSubLabel "第七百条の五十五" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七百条の五十五" := by native_decide
example : isArticleSubLabel "第七百条の五十八" = true := by native_decide
example : isArticleSubLabel "第七百条の五十八" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七百条の五十八" := by native_decide
example : isArticleSubLabel "第七百条の五十六" = true := by native_decide
example : isArticleSubLabel "第七百条の五十六" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七百条の五十六" := by native_decide
example : isArticleSubLabel "第七百条の五十四" = true := by native_decide
example : isArticleSubLabel "第七百条の五十四" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七百条の五十四" := by native_decide
example : isArticleSubLabel "第七百条の六十" = true := by native_decide
example : isArticleSubLabel "第七百条の六十" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七百条の六十" := by native_decide
example : isArticleSubLabel "第七百条の六十一" = true := by native_decide
example : isArticleSubLabel "第七百条の六十一" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七百条の六十一" := by native_decide
example : isArticleSubLabel "第七百条の六十七" = true := by native_decide
example : isArticleSubLabel "第七百条の六十七" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七百条の六十七" := by native_decide
example : isArticleSubLabel "第七百条の六十三" = true := by native_decide
example : isArticleSubLabel "第七百条の六十三" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七百条の六十三" := by native_decide
example : isArticleSubLabel "第七百条の六十九" = true := by native_decide
example : isArticleSubLabel "第七百条の六十九" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七百条の六十九" := by native_decide
example : isArticleSubLabel "第七百条の六十二" = true := by native_decide
example : isArticleSubLabel "第七百条の六十二" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七百条の六十二" := by native_decide
example : isArticleSubLabel "第七百条の六十五" = true := by native_decide
example : isArticleSubLabel "第七百条の六十五" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七百条の六十五" := by native_decide
example : isArticleSubLabel "第七百条の六十八" = true := by native_decide
example : isArticleSubLabel "第七百条の六十八" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七百条の六十八" := by native_decide
example : isArticleSubLabel "第七百条の六十六" = true := by native_decide
example : isArticleSubLabel "第七百条の六十六" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七百条の六十六" := by native_decide
example : isArticleSubLabel "第七百条の六十四" = true := by native_decide
example : isArticleSubLabel "第七百条の六十四" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第七百条の六十四" := by native_decide
example : isArticleSubLabel "第三十一条の七" = true := by native_decide
example : isArticleSubLabel "第三十一条の七" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第三十一条の七" := by native_decide
example : isArticleSubLabel "第三十一条の九" = true := by native_decide
example : isArticleSubLabel "第三十一条の九" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第三十一条の九" := by native_decide
example : isArticleSubLabel "第三十一条の五" = true := by native_decide
example : isArticleSubLabel "第三十一条の五" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第三十一条の五" := by native_decide
example : isArticleSubLabel "第三十一条の八" = true := by native_decide
example : isArticleSubLabel "第三十一条の八" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第三十一条の八" := by native_decide
example : isArticleSubLabel "第三十一条の六" = true := by native_decide
example : isArticleSubLabel "第三十一条の六" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第三十一条の六" := by native_decide
example : isArticleSubLabel "第三十一条の十" = true := by native_decide
example : isArticleSubLabel "第三十一条の十" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第三十一条の十" := by native_decide
example : isArticleSubLabel "第三十一条の十一" = true := by native_decide
example : isArticleSubLabel "第三十一条の十一" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第三十一条の十一" := by native_decide
example : isArticleSubLabel "第三十一条の四" = true := by native_decide
example : isArticleSubLabel "第三十一条の四" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第三十一条の四" := by native_decide
example : isArticleSubLabel "第三十七条の七" = true := by native_decide
example : isArticleSubLabel "第三十七条の七" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第三十七条の七" := by native_decide
example : isArticleSubLabel "第三十七条の九" = true := by native_decide
example : isArticleSubLabel "第三十七条の九" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第三十七条の九" := by native_decide
example : isArticleSubLabel "第三十七条の五" = true := by native_decide
example : isArticleSubLabel "第三十七条の五" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第三十七条の五" := by native_decide
example : isArticleSubLabel "第三十七条の八" = true := by native_decide
example : isArticleSubLabel "第三十七条の八" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第三十七条の八" := by native_decide
example : isArticleSubLabel "第三十七条の六" = true := by native_decide
example : isArticleSubLabel "第三十七条の六" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第三十七条の六" := by native_decide
example : isArticleSubLabel "第三十七条の十" = true := by native_decide
example : isArticleSubLabel "第三十七条の十" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第三十七条の十" := by native_decide
example : isArticleSubLabel "第三十七条の十一" = true := by native_decide
example : isArticleSubLabel "第三十七条の十一" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第三十七条の十一" := by native_decide
example : isArticleSubLabel "第三十七条の十七" = true := by native_decide
example : isArticleSubLabel "第三十七条の十七" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第三十七条の十七" := by native_decide
example : isArticleSubLabel "第三十七条の十三" = true := by native_decide
example : isArticleSubLabel "第三十七条の十三" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第三十七条の十三" := by native_decide
example : isArticleSubLabel "第三十七条の十二" = true := by native_decide
example : isArticleSubLabel "第三十七条の十二" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第三十七条の十二" := by native_decide
example : isArticleSubLabel "第三十七条の十五" = true := by native_decide
example : isArticleSubLabel "第三十七条の十五" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第三十七条の十五" := by native_decide
example : isArticleSubLabel "第三十七条の十八" = true := by native_decide
example : isArticleSubLabel "第三十七条の十八" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第三十七条の十八" := by native_decide
example : isArticleSubLabel "第三十七条の十六" = true := by native_decide
example : isArticleSubLabel "第三十七条の十六" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第三十七条の十六" := by native_decide
example : isArticleSubLabel "第三十七条の十四" = true := by native_decide
example : isArticleSubLabel "第三十七条の十四" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第三十七条の十四" := by native_decide
example : isArticleSubLabel "第三十七条の四" = true := by native_decide
example : isArticleSubLabel "第三十七条の四" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第三十七条の四" := by native_decide
example : isArticleSubLabel "第三十三条の七" = true := by native_decide
example : isArticleSubLabel "第三十三条の七" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第三十三条の七" := by native_decide
example : isArticleSubLabel "第三十三条の九" = true := by native_decide
example : isArticleSubLabel "第三十三条の九" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第三十三条の九" := by native_decide
example : isArticleSubLabel "第三十三条の五" = true := by native_decide
example : isArticleSubLabel "第三十三条の五" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第三十三条の五" := by native_decide
example : isArticleSubLabel "第三十三条の八" = true := by native_decide
example : isArticleSubLabel "第三十三条の八" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第三十三条の八" := by native_decide
example : isArticleSubLabel "第三十三条の六" = true := by native_decide
example : isArticleSubLabel "第三十三条の六" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第三十三条の六" := by native_decide
example : isArticleSubLabel "第三十三条の十" = true := by native_decide
example : isArticleSubLabel "第三十三条の十" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第三十三条の十" := by native_decide
example : isArticleSubLabel "第三十三条の十一" = true := by native_decide
example : isArticleSubLabel "第三十三条の十一" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第三十三条の十一" := by native_decide
example : isArticleSubLabel "第三十三条の四" = true := by native_decide
example : isArticleSubLabel "第三十三条の四" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第三十三条の四" := by native_decide
example : isArticleSubLabel "第三十九条の七" = true := by native_decide
example : isArticleSubLabel "第三十九条の七" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第三十九条の七" := by native_decide
example : isArticleSubLabel "第三十九条の九" = true := by native_decide
example : isArticleSubLabel "第三十九条の九" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第三十九条の九" := by native_decide
example : isArticleSubLabel "第三十九条の五" = true := by native_decide
example : isArticleSubLabel "第三十九条の五" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第三十九条の五" := by native_decide
example : isArticleSubLabel "第三十九条の八" = true := by native_decide
example : isArticleSubLabel "第三十九条の八" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第三十九条の八" := by native_decide
example : isArticleSubLabel "第三十九条の六" = true := by native_decide
example : isArticleSubLabel "第三十九条の六" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第三十九条の六" := by native_decide
example : isArticleSubLabel "第三十九条の十" = true := by native_decide
example : isArticleSubLabel "第三十九条の十" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第三十九条の十" := by native_decide
example : isArticleSubLabel "第三十九条の十一" = true := by native_decide
example : isArticleSubLabel "第三十九条の十一" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第三十九条の十一" := by native_decide
example : isArticleSubLabel "第三十九条の十七" = true := by native_decide
example : isArticleSubLabel "第三十九条の十七" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第三十九条の十七" := by native_decide
example : isArticleSubLabel "第三十九条の十三" = true := by native_decide
example : isArticleSubLabel "第三十九条の十三" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第三十九条の十三" := by native_decide
example : isArticleSubLabel "第三十九条の十九" = true := by native_decide
example : isArticleSubLabel "第三十九条の十九" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第三十九条の十九" := by native_decide
example : isArticleSubLabel "第三十九条の十二" = true := by native_decide
example : isArticleSubLabel "第三十九条の十二" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第三十九条の十二" := by native_decide
example : isArticleSubLabel "第三十九条の十五" = true := by native_decide
example : isArticleSubLabel "第三十九条の十五" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第三十九条の十五" := by native_decide
example : isArticleSubLabel "第三十九条の十八" = true := by native_decide
example : isArticleSubLabel "第三十九条の十八" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第三十九条の十八" := by native_decide
example : isArticleSubLabel "第三十九条の十六" = true := by native_decide
example : isArticleSubLabel "第三十九条の十六" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第三十九条の十六" := by native_decide
example : isArticleSubLabel "第三十九条の十四" = true := by native_decide
example : isArticleSubLabel "第三十九条の十四" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第三十九条の十四" := by native_decide
example : isArticleSubLabel "第三十九条の四" = true := by native_decide
example : isArticleSubLabel "第三十九条の四" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第三十九条の四" := by native_decide
example : isArticleSubLabel "第三十二条の四" = true := by native_decide
example : isArticleSubLabel "第三十二条の四" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第三十二条の四" := by native_decide
example : isArticleSubLabel "第三十五条の七" = true := by native_decide
example : isArticleSubLabel "第三十五条の七" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第三十五条の七" := by native_decide
example : isArticleSubLabel "第三十五条の九" = true := by native_decide
example : isArticleSubLabel "第三十五条の九" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第三十五条の九" := by native_decide
example : isArticleSubLabel "第三十五条の五" = true := by native_decide
example : isArticleSubLabel "第三十五条の五" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第三十五条の五" := by native_decide
example : isArticleSubLabel "第三十五条の八" = true := by native_decide
example : isArticleSubLabel "第三十五条の八" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第三十五条の八" := by native_decide
example : isArticleSubLabel "第三十五条の六" = true := by native_decide
example : isArticleSubLabel "第三十五条の六" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第三十五条の六" := by native_decide
example : isArticleSubLabel "第三十五条の十" = true := by native_decide
example : isArticleSubLabel "第三十五条の十" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第三十五条の十" := by native_decide
example : isArticleSubLabel "第三十五条の十一" = true := by native_decide
example : isArticleSubLabel "第三十五条の十一" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第三十五条の十一" := by native_decide
example : isArticleSubLabel "第三十五条の十七" = true := by native_decide
example : isArticleSubLabel "第三十五条の十七" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第三十五条の十七" := by native_decide
example : isArticleSubLabel "第三十五条の十三" = true := by native_decide
example : isArticleSubLabel "第三十五条の十三" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第三十五条の十三" := by native_decide
example : isArticleSubLabel "第三十五条の十九" = true := by native_decide
example : isArticleSubLabel "第三十五条の十九" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第三十五条の十九" := by native_decide
example : isArticleSubLabel "第三十五条の十二" = true := by native_decide
example : isArticleSubLabel "第三十五条の十二" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第三十五条の十二" := by native_decide
example : isArticleSubLabel "第三十五条の十五" = true := by native_decide
example : isArticleSubLabel "第三十五条の十五" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第三十五条の十五" := by native_decide
example : isArticleSubLabel "第三十五条の十八" = true := by native_decide
example : isArticleSubLabel "第三十五条の十八" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第三十五条の十八" := by native_decide
example : isArticleSubLabel "第三十五条の十六" = true := by native_decide
example : isArticleSubLabel "第三十五条の十六" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第三十五条の十六" := by native_decide
example : isArticleSubLabel "第三十五条の十四" = true := by native_decide
example : isArticleSubLabel "第三十五条の十四" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第三十五条の十四" := by native_decide
example : isArticleSubLabel "第三十五条の四" = true := by native_decide
example : isArticleSubLabel "第三十五条の四" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第三十五条の四" := by native_decide
example : isArticleSubLabel "第三十八条の七" = true := by native_decide
example : isArticleSubLabel "第三十八条の七" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第三十八条の七" := by native_decide
example : isArticleSubLabel "第三十八条の七十" = true := by native_decide
example : isArticleSubLabel "第三十八条の七十" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第三十八条の七十" := by native_decide
example : isArticleSubLabel "第三十八条の七十一" = true := by native_decide
example : isArticleSubLabel "第三十八条の七十一" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第三十八条の七十一" := by native_decide
example : isArticleSubLabel "第三十八条の九" = true := by native_decide
example : isArticleSubLabel "第三十八条の九" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第三十八条の九" := by native_decide
example : isArticleSubLabel "第三十八条の五" = true := by native_decide
example : isArticleSubLabel "第三十八条の五" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第三十八条の五" := by native_decide
example : isArticleSubLabel "第三十八条の五十" = true := by native_decide
example : isArticleSubLabel "第三十八条の五十" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第三十八条の五十" := by native_decide
example : isArticleSubLabel "第三十八条の五十一" = true := by native_decide
example : isArticleSubLabel "第三十八条の五十一" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第三十八条の五十一" := by native_decide
example : isArticleSubLabel "第三十八条の五十七" = true := by native_decide
example : isArticleSubLabel "第三十八条の五十七" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第三十八条の五十七" := by native_decide
example : isArticleSubLabel "第三十八条の五十三" = true := by native_decide
example : isArticleSubLabel "第三十八条の五十三" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第三十八条の五十三" := by native_decide
example : isArticleSubLabel "第三十八条の五十九" = true := by native_decide
example : isArticleSubLabel "第三十八条の五十九" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第三十八条の五十九" := by native_decide
example : isArticleSubLabel "第三十八条の五十二" = true := by native_decide
example : isArticleSubLabel "第三十八条の五十二" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第三十八条の五十二" := by native_decide
example : isArticleSubLabel "第三十八条の五十五" = true := by native_decide
example : isArticleSubLabel "第三十八条の五十五" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第三十八条の五十五" := by native_decide
example : isArticleSubLabel "第三十八条の五十八" = true := by native_decide
example : isArticleSubLabel "第三十八条の五十八" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第三十八条の五十八" := by native_decide
example : isArticleSubLabel "第三十八条の五十六" = true := by native_decide
example : isArticleSubLabel "第三十八条の五十六" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第三十八条の五十六" := by native_decide
example : isArticleSubLabel "第三十八条の五十四" = true := by native_decide
example : isArticleSubLabel "第三十八条の五十四" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第三十八条の五十四" := by native_decide
example : isArticleSubLabel "第三十八条の八" = true := by native_decide
example : isArticleSubLabel "第三十八条の八" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第三十八条の八" := by native_decide
example : isArticleSubLabel "第三十八条の六" = true := by native_decide
example : isArticleSubLabel "第三十八条の六" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第三十八条の六" := by native_decide
example : isArticleSubLabel "第三十八条の六十" = true := by native_decide
example : isArticleSubLabel "第三十八条の六十" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第三十八条の六十" := by native_decide
example : isArticleSubLabel "第三十八条の六十一" = true := by native_decide
example : isArticleSubLabel "第三十八条の六十一" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第三十八条の六十一" := by native_decide
example : isArticleSubLabel "第三十八条の六十七" = true := by native_decide
example : isArticleSubLabel "第三十八条の六十七" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第三十八条の六十七" := by native_decide
example : isArticleSubLabel "第三十八条の六十三" = true := by native_decide
example : isArticleSubLabel "第三十八条の六十三" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第三十八条の六十三" := by native_decide
example : isArticleSubLabel "第三十八条の六十九" = true := by native_decide
example : isArticleSubLabel "第三十八条の六十九" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第三十八条の六十九" := by native_decide
example : isArticleSubLabel "第三十八条の六十二" = true := by native_decide
example : isArticleSubLabel "第三十八条の六十二" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第三十八条の六十二" := by native_decide
example : isArticleSubLabel "第三十八条の六十五" = true := by native_decide
example : isArticleSubLabel "第三十八条の六十五" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第三十八条の六十五" := by native_decide
example : isArticleSubLabel "第三十八条の六十八" = true := by native_decide
example : isArticleSubLabel "第三十八条の六十八" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第三十八条の六十八" := by native_decide
example : isArticleSubLabel "第三十八条の六十六" = true := by native_decide
example : isArticleSubLabel "第三十八条の六十六" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第三十八条の六十六" := by native_decide
example : isArticleSubLabel "第三十八条の六十四" = true := by native_decide
example : isArticleSubLabel "第三十八条の六十四" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第三十八条の六十四" := by native_decide
example : isArticleSubLabel "第三十八条の十" = true := by native_decide
example : isArticleSubLabel "第三十八条の十" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第三十八条の十" := by native_decide
example : isArticleSubLabel "第三十八条の十一" = true := by native_decide
example : isArticleSubLabel "第三十八条の十一" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第三十八条の十一" := by native_decide
example : isArticleSubLabel "第三十八条の十七" = true := by native_decide
example : isArticleSubLabel "第三十八条の十七" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第三十八条の十七" := by native_decide
example : isArticleSubLabel "第三十八条の十三" = true := by native_decide
example : isArticleSubLabel "第三十八条の十三" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第三十八条の十三" := by native_decide
example : isArticleSubLabel "第三十八条の十九" = true := by native_decide
example : isArticleSubLabel "第三十八条の十九" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第三十八条の十九" := by native_decide
example : isArticleSubLabel "第三十八条の十二" = true := by native_decide
example : isArticleSubLabel "第三十八条の十二" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第三十八条の十二" := by native_decide
example : isArticleSubLabel "第三十八条の十五" = true := by native_decide
example : isArticleSubLabel "第三十八条の十五" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第三十八条の十五" := by native_decide
example : isArticleSubLabel "第三十八条の十八" = true := by native_decide
example : isArticleSubLabel "第三十八条の十八" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第三十八条の十八" := by native_decide
example : isArticleSubLabel "第三十八条の十六" = true := by native_decide
example : isArticleSubLabel "第三十八条の十六" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第三十八条の十六" := by native_decide
example : isArticleSubLabel "第三十八条の十四" = true := by native_decide
example : isArticleSubLabel "第三十八条の十四" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第三十八条の十四" := by native_decide
example : isArticleSubLabel "第三十八条の四" = true := by native_decide
example : isArticleSubLabel "第三十八条の四" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第三十八条の四" := by native_decide
example : isArticleSubLabel "第三十八条の四十" = true := by native_decide
example : isArticleSubLabel "第三十八条の四十" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第三十八条の四十" := by native_decide
example : isArticleSubLabel "第三十八条の四十一" = true := by native_decide
example : isArticleSubLabel "第三十八条の四十一" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第三十八条の四十一" := by native_decide
example : isArticleSubLabel "第三十八条の四十七" = true := by native_decide
example : isArticleSubLabel "第三十八条の四十七" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第三十八条の四十七" := by native_decide
example : isArticleSubLabel "第三十八条の四十三" = true := by native_decide
example : isArticleSubLabel "第三十八条の四十三" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第三十八条の四十三" := by native_decide
example : isArticleSubLabel "第三十八条の四十九" = true := by native_decide
example : isArticleSubLabel "第三十八条の四十九" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第三十八条の四十九" := by native_decide
example : isArticleSubLabel "第三十八条の四十二" = true := by native_decide
example : isArticleSubLabel "第三十八条の四十二" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第三十八条の四十二" := by native_decide
example : isArticleSubLabel "第三十八条の四十五" = true := by native_decide
example : isArticleSubLabel "第三十八条の四十五" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第三十八条の四十五" := by native_decide
example : isArticleSubLabel "第三十八条の四十八" = true := by native_decide
example : isArticleSubLabel "第三十八条の四十八" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第三十八条の四十八" := by native_decide
example : isArticleSubLabel "第三十八条の四十六" = true := by native_decide
example : isArticleSubLabel "第三十八条の四十六" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第三十八条の四十六" := by native_decide
example : isArticleSubLabel "第三十八条の四十四" = true := by native_decide
example : isArticleSubLabel "第三十八条の四十四" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第三十八条の四十四" := by native_decide
example : isArticleSubLabel "第三十六条の七" = true := by native_decide
example : isArticleSubLabel "第三十六条の七" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第三十六条の七" := by native_decide
example : isArticleSubLabel "第三十六条の九" = true := by native_decide
example : isArticleSubLabel "第三十六条の九" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第三十六条の九" := by native_decide
example : isArticleSubLabel "第三十六条の五" = true := by native_decide
example : isArticleSubLabel "第三十六条の五" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第三十六条の五" := by native_decide
example : isArticleSubLabel "第三十六条の八" = true := by native_decide
example : isArticleSubLabel "第三十六条の八" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第三十六条の八" := by native_decide
example : isArticleSubLabel "第三十六条の六" = true := by native_decide
example : isArticleSubLabel "第三十六条の六" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第三十六条の六" := by native_decide
example : isArticleSubLabel "第三十六条の十" = true := by native_decide
example : isArticleSubLabel "第三十六条の十" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第三十六条の十" := by native_decide
example : isArticleSubLabel "第三十六条の十一" = true := by native_decide
example : isArticleSubLabel "第三十六条の十一" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第三十六条の十一" := by native_decide
example : isArticleSubLabel "第三十六条の四" = true := by native_decide
example : isArticleSubLabel "第三十六条の四" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第三十六条の四" := by native_decide
example : isArticleSubLabel "第三十四条の七" = true := by native_decide
example : isArticleSubLabel "第三十四条の七" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第三十四条の七" := by native_decide
example : isArticleSubLabel "第三十四条の五" = true := by native_decide
example : isArticleSubLabel "第三十四条の五" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第三十四条の五" := by native_decide
example : isArticleSubLabel "第三十四条の六" = true := by native_decide
example : isArticleSubLabel "第三十四条の六" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第三十四条の六" := by native_decide
example : isArticleSubLabel "第三十四条の四" = true := by native_decide
example : isArticleSubLabel "第三十四条の四" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第三十四条の四" := by native_decide
example : isArticleSubLabel "第三十条の七" = true := by native_decide
example : isArticleSubLabel "第三十条の七" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第三十条の七" := by native_decide
example : isArticleSubLabel "第三十条の五" = true := by native_decide
example : isArticleSubLabel "第三十条の五" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第三十条の五" := by native_decide
example : isArticleSubLabel "第三十条の八" = true := by native_decide
example : isArticleSubLabel "第三十条の八" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第三十条の八" := by native_decide
example : isArticleSubLabel "第三十条の六" = true := by native_decide
example : isArticleSubLabel "第三十条の六" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第三十条の六" := by native_decide
example : isArticleSubLabel "第三十条の四" = true := by native_decide
example : isArticleSubLabel "第三十条の四" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第三十条の四" := by native_decide
example : isArticleSubLabel "第三条の七" = true := by native_decide
example : isArticleSubLabel "第三条の七" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第三条の七" := by native_decide
example : isArticleSubLabel "第三条の九" = true := by native_decide
example : isArticleSubLabel "第三条の九" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第三条の九" := by native_decide
example : isArticleSubLabel "第三条の五" = true := by native_decide
example : isArticleSubLabel "第三条の五" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第三条の五" := by native_decide
example : isArticleSubLabel "第三条の八" = true := by native_decide
example : isArticleSubLabel "第三条の八" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第三条の八" := by native_decide
example : isArticleSubLabel "第三条の六" = true := by native_decide
example : isArticleSubLabel "第三条の六" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第三条の六" := by native_decide
example : isArticleSubLabel "第三条の十" = true := by native_decide
example : isArticleSubLabel "第三条の十" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第三条の十" := by native_decide
example : isArticleSubLabel "第三条の十一" = true := by native_decide
example : isArticleSubLabel "第三条の十一" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第三条の十一" := by native_decide
example : isArticleSubLabel "第三条の十七" = true := by native_decide
example : isArticleSubLabel "第三条の十七" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第三条の十七" := by native_decide
example : isArticleSubLabel "第三条の十三" = true := by native_decide
example : isArticleSubLabel "第三条の十三" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第三条の十三" := by native_decide
example : isArticleSubLabel "第三条の十九" = true := by native_decide
example : isArticleSubLabel "第三条の十九" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第三条の十九" := by native_decide
example : isArticleSubLabel "第三条の十二" = true := by native_decide
example : isArticleSubLabel "第三条の十二" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第三条の十二" := by native_decide
example : isArticleSubLabel "第三条の十五" = true := by native_decide
example : isArticleSubLabel "第三条の十五" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第三条の十五" := by native_decide
example : isArticleSubLabel "第三条の十八" = true := by native_decide
example : isArticleSubLabel "第三条の十八" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第三条の十八" := by native_decide
example : isArticleSubLabel "第三条の十六" = true := by native_decide
example : isArticleSubLabel "第三条の十六" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第三条の十六" := by native_decide
example : isArticleSubLabel "第三条の十四" = true := by native_decide
example : isArticleSubLabel "第三条の十四" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第三条の十四" := by native_decide
example : isArticleSubLabel "第三条の四" = true := by native_decide
example : isArticleSubLabel "第三条の四" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第三条の四" := by native_decide
example : isArticleSubLabel "第三百九十六条の五" = true := by native_decide
example : isArticleSubLabel "第三百九十六条の五" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第三百九十六条の五" := by native_decide
example : isArticleSubLabel "第三百九十六条の四" = true := by native_decide
example : isArticleSubLabel "第三百九十六条の四" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第三百九十六条の四" := by native_decide
example : isArticleSubLabel "第三百二十一条の七" = true := by native_decide
example : isArticleSubLabel "第三百二十一条の七" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第三百二十一条の七" := by native_decide
example : isArticleSubLabel "第三百二十一条の九" = true := by native_decide
example : isArticleSubLabel "第三百二十一条の九" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第三百二十一条の九" := by native_decide
example : isArticleSubLabel "第三百二十一条の五" = true := by native_decide
example : isArticleSubLabel "第三百二十一条の五" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第三百二十一条の五" := by native_decide
example : isArticleSubLabel "第三百二十一条の八" = true := by native_decide
example : isArticleSubLabel "第三百二十一条の八" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第三百二十一条の八" := by native_decide
example : isArticleSubLabel "第三百二十一条の六" = true := by native_decide
example : isArticleSubLabel "第三百二十一条の六" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第三百二十一条の六" := by native_decide
example : isArticleSubLabel "第三百二十一条の十" = true := by native_decide
example : isArticleSubLabel "第三百二十一条の十" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第三百二十一条の十" := by native_decide
example : isArticleSubLabel "第三百二十一条の十一" = true := by native_decide
example : isArticleSubLabel "第三百二十一条の十一" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第三百二十一条の十一" := by native_decide
example : isArticleSubLabel "第三百二十一条の十三" = true := by native_decide
example : isArticleSubLabel "第三百二十一条の十三" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第三百二十一条の十三" := by native_decide
example : isArticleSubLabel "第三百二十一条の十二" = true := by native_decide
example : isArticleSubLabel "第三百二十一条の十二" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第三百二十一条の十二" := by native_decide
example : isArticleSubLabel "第三百二十一条の十五" = true := by native_decide
example : isArticleSubLabel "第三百二十一条の十五" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第三百二十一条の十五" := by native_decide
example : isArticleSubLabel "第三百二十一条の十四" = true := by native_decide
example : isArticleSubLabel "第三百二十一条の十四" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第三百二十一条の十四" := by native_decide
example : isArticleSubLabel "第三百二十一条の四" = true := by native_decide
example : isArticleSubLabel "第三百二十一条の四" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第三百二十一条の四" := by native_decide
example : isArticleSubLabel "第三百二十八条の七" = true := by native_decide
example : isArticleSubLabel "第三百二十八条の七" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第三百二十八条の七" := by native_decide
example : isArticleSubLabel "第三百二十八条の九" = true := by native_decide
example : isArticleSubLabel "第三百二十八条の九" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第三百二十八条の九" := by native_decide
example : isArticleSubLabel "第三百二十八条の五" = true := by native_decide
example : isArticleSubLabel "第三百二十八条の五" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第三百二十八条の五" := by native_decide
example : isArticleSubLabel "第三百二十八条の八" = true := by native_decide
example : isArticleSubLabel "第三百二十八条の八" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第三百二十八条の八" := by native_decide
example : isArticleSubLabel "第三百二十八条の六" = true := by native_decide
example : isArticleSubLabel "第三百二十八条の六" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第三百二十八条の六" := by native_decide
example : isArticleSubLabel "第三百二十八条の十" = true := by native_decide
example : isArticleSubLabel "第三百二十八条の十" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第三百二十八条の十" := by native_decide
example : isArticleSubLabel "第三百二十八条の十一" = true := by native_decide
example : isArticleSubLabel "第三百二十八条の十一" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第三百二十八条の十一" := by native_decide
example : isArticleSubLabel "第三百二十八条の十三" = true := by native_decide
example : isArticleSubLabel "第三百二十八条の十三" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第三百二十八条の十三" := by native_decide
example : isArticleSubLabel "第三百二十八条の十二" = true := by native_decide
example : isArticleSubLabel "第三百二十八条の十二" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第三百二十八条の十二" := by native_decide
example : isArticleSubLabel "第三百二十八条の十五" = true := by native_decide
example : isArticleSubLabel "第三百二十八条の十五" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第三百二十八条の十五" := by native_decide
example : isArticleSubLabel "第三百二十八条の十六" = true := by native_decide
example : isArticleSubLabel "第三百二十八条の十六" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第三百二十八条の十六" := by native_decide
example : isArticleSubLabel "第三百二十八条の十四" = true := by native_decide
example : isArticleSubLabel "第三百二十八条の十四" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第三百二十八条の十四" := by native_decide
example : isArticleSubLabel "第三百二十八条の四" = true := by native_decide
example : isArticleSubLabel "第三百二十八条の四" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第三百二十八条の四" := by native_decide
example : isArticleSubLabel "第三百五十二条の四" = true := by native_decide
example : isArticleSubLabel "第三百五十二条の四" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第三百五十二条の四" := by native_decide
example : isArticleSubLabel "第三百五十条の七" = true := by native_decide
example : isArticleSubLabel "第三百五十条の七" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第三百五十条の七" := by native_decide
example : isArticleSubLabel "第三百五十条の九" = true := by native_decide
example : isArticleSubLabel "第三百五十条の九" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第三百五十条の九" := by native_decide
example : isArticleSubLabel "第三百五十条の五" = true := by native_decide
example : isArticleSubLabel "第三百五十条の五" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第三百五十条の五" := by native_decide
example : isArticleSubLabel "第三百五十条の八" = true := by native_decide
example : isArticleSubLabel "第三百五十条の八" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第三百五十条の八" := by native_decide
example : isArticleSubLabel "第三百五十条の六" = true := by native_decide
example : isArticleSubLabel "第三百五十条の六" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第三百五十条の六" := by native_decide
example : isArticleSubLabel "第三百五十条の十" = true := by native_decide
example : isArticleSubLabel "第三百五十条の十" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第三百五十条の十" := by native_decide
example : isArticleSubLabel "第三百五十条の四" = true := by native_decide
example : isArticleSubLabel "第三百五十条の四" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第三百五十条の四" := by native_decide
example : isArticleSubLabel "第三百八十二条の四" = true := by native_decide
example : isArticleSubLabel "第三百八十二条の四" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第三百八十二条の四" := by native_decide
example : isArticleSubLabel "第三百十七条の七" = true := by native_decide
example : isArticleSubLabel "第三百十七条の七" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第三百十七条の七" := by native_decide
example : isArticleSubLabel "第三百十七条の五" = true := by native_decide
example : isArticleSubLabel "第三百十七条の五" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第三百十七条の五" := by native_decide
example : isArticleSubLabel "第三百十七条の六" = true := by native_decide
example : isArticleSubLabel "第三百十七条の六" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第三百十七条の六" := by native_decide
example : isArticleSubLabel "第三百十七条の四" = true := by native_decide
example : isArticleSubLabel "第三百十七条の四" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第三百十七条の四" := by native_decide
example : isArticleSubLabel "第三百十九条の七" = true := by native_decide
example : isArticleSubLabel "第三百十九条の七" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第三百十九条の七" := by native_decide
example : isArticleSubLabel "第三百十九条の九" = true := by native_decide
example : isArticleSubLabel "第三百十九条の九" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第三百十九条の九" := by native_decide
example : isArticleSubLabel "第三百十九条の五" = true := by native_decide
example : isArticleSubLabel "第三百十九条の五" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第三百十九条の五" := by native_decide
example : isArticleSubLabel "第三百十九条の八" = true := by native_decide
example : isArticleSubLabel "第三百十九条の八" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第三百十九条の八" := by native_decide
example : isArticleSubLabel "第三百十九条の六" = true := by native_decide
example : isArticleSubLabel "第三百十九条の六" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第三百十九条の六" := by native_decide
example : isArticleSubLabel "第三百十九条の十" = true := by native_decide
example : isArticleSubLabel "第三百十九条の十" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第三百十九条の十" := by native_decide
example : isArticleSubLabel "第三百十九条の十一" = true := by native_decide
example : isArticleSubLabel "第三百十九条の十一" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第三百十九条の十一" := by native_decide
example : isArticleSubLabel "第三百十九条の十二" = true := by native_decide
example : isArticleSubLabel "第三百十九条の十二" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第三百十九条の十二" := by native_decide
example : isArticleSubLabel "第三百十九条の四" = true := by native_decide
example : isArticleSubLabel "第三百十九条の四" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第三百十九条の四" := by native_decide
example : isArticleSubLabel "第三百十八条の四" = true := by native_decide
example : isArticleSubLabel "第三百十八条の四" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第三百十八条の四" := by native_decide
example : isArticleSubLabel "第三百十四条の七" = true := by native_decide
example : isArticleSubLabel "第三百十四条の七" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第三百十四条の七" := by native_decide
example : isArticleSubLabel "第三百十四条の九" = true := by native_decide
example : isArticleSubLabel "第三百十四条の九" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第三百十四条の九" := by native_decide
example : isArticleSubLabel "第三百十四条の五" = true := by native_decide
example : isArticleSubLabel "第三百十四条の五" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第三百十四条の五" := by native_decide
example : isArticleSubLabel "第三百十四条の八" = true := by native_decide
example : isArticleSubLabel "第三百十四条の八" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第三百十四条の八" := by native_decide
example : isArticleSubLabel "第三百十四条の六" = true := by native_decide
example : isArticleSubLabel "第三百十四条の六" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第三百十四条の六" := by native_decide
example : isArticleSubLabel "第三百十四条の四" = true := by native_decide
example : isArticleSubLabel "第三百十四条の四" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第三百十四条の四" := by native_decide
example : isArticleSubLabel "第三百四十九条の五" = true := by native_decide
example : isArticleSubLabel "第三百四十九条の五" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第三百四十九条の五" := by native_decide
example : isArticleSubLabel "第三百四十九条の四" = true := by native_decide
example : isArticleSubLabel "第三百四十九条の四" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第三百四十九条の四" := by native_decide
example : isArticleSubLabel "第九十一条の四" = true := by native_decide
example : isArticleSubLabel "第九十一条の四" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第九十一条の四" := by native_decide
example : isArticleSubLabel "第九十七条の四" = true := by native_decide
example : isArticleSubLabel "第九十七条の四" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第九十七条の四" := by native_decide
example : isArticleSubLabel "第九十四条の五" = true := by native_decide
example : isArticleSubLabel "第九十四条の五" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第九十四条の五" := by native_decide
example : isArticleSubLabel "第九十四条の六" = true := by native_decide
example : isArticleSubLabel "第九十四条の六" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第九十四条の六" := by native_decide
example : isArticleSubLabel "第九十四条の四" = true := by native_decide
example : isArticleSubLabel "第九十四条の四" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第九十四条の四" := by native_decide
example : isArticleSubLabel "第九十条の七" = true := by native_decide
example : isArticleSubLabel "第九十条の七" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第九十条の七" := by native_decide
example : isArticleSubLabel "第九十条の九" = true := by native_decide
example : isArticleSubLabel "第九十条の九" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第九十条の九" := by native_decide
example : isArticleSubLabel "第九十条の五" = true := by native_decide
example : isArticleSubLabel "第九十条の五" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第九十条の五" := by native_decide
example : isArticleSubLabel "第九十条の八" = true := by native_decide
example : isArticleSubLabel "第九十条の八" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第九十条の八" := by native_decide
example : isArticleSubLabel "第九十条の六" = true := by native_decide
example : isArticleSubLabel "第九十条の六" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第九十条の六" := by native_decide
example : isArticleSubLabel "第九十条の十" = true := by native_decide
example : isArticleSubLabel "第九十条の十" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第九十条の十" := by native_decide
example : isArticleSubLabel "第九十条の十一" = true := by native_decide
example : isArticleSubLabel "第九十条の十一" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第九十条の十一" := by native_decide
example : isArticleSubLabel "第九十条の十三" = true := by native_decide
example : isArticleSubLabel "第九十条の十三" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第九十条の十三" := by native_decide
example : isArticleSubLabel "第九十条の十二" = true := by native_decide
example : isArticleSubLabel "第九十条の十二" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第九十条の十二" := by native_decide
example : isArticleSubLabel "第九十条の十五" = true := by native_decide
example : isArticleSubLabel "第九十条の十五" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第九十条の十五" := by native_decide
example : isArticleSubLabel "第九十条の十六" = true := by native_decide
example : isArticleSubLabel "第九十条の十六" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第九十条の十六" := by native_decide
example : isArticleSubLabel "第九十条の十四" = true := by native_decide
example : isArticleSubLabel "第九十条の十四" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第九十条の十四" := by native_decide
example : isArticleSubLabel "第九十条の四" = true := by native_decide
example : isArticleSubLabel "第九十条の四" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第九十条の四" := by native_decide
example : isArticleSubLabel "第九条の七" = true := by native_decide
example : isArticleSubLabel "第九条の七" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第九条の七" := by native_decide
example : isArticleSubLabel "第九条の九" = true := by native_decide
example : isArticleSubLabel "第九条の九" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第九条の九" := by native_decide
example : isArticleSubLabel "第九条の五" = true := by native_decide
example : isArticleSubLabel "第九条の五" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第九条の五" := by native_decide
example : isArticleSubLabel "第九条の八" = true := by native_decide
example : isArticleSubLabel "第九条の八" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第九条の八" := by native_decide
example : isArticleSubLabel "第九条の六" = true := by native_decide
example : isArticleSubLabel "第九条の六" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第九条の六" := by native_decide
example : isArticleSubLabel "第九条の十" = true := by native_decide
example : isArticleSubLabel "第九条の十" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第九条の十" := by native_decide
example : isArticleSubLabel "第九条の十一" = true := by native_decide
example : isArticleSubLabel "第九条の十一" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第九条の十一" := by native_decide
example : isArticleSubLabel "第九条の十七" = true := by native_decide
example : isArticleSubLabel "第九条の十七" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第九条の十七" := by native_decide
example : isArticleSubLabel "第九条の十三" = true := by native_decide
example : isArticleSubLabel "第九条の十三" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第九条の十三" := by native_decide
example : isArticleSubLabel "第九条の十九" = true := by native_decide
example : isArticleSubLabel "第九条の十九" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第九条の十九" := by native_decide
example : isArticleSubLabel "第九条の十二" = true := by native_decide
example : isArticleSubLabel "第九条の十二" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第九条の十二" := by native_decide
example : isArticleSubLabel "第九条の十五" = true := by native_decide
example : isArticleSubLabel "第九条の十五" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第九条の十五" := by native_decide
example : isArticleSubLabel "第九条の十八" = true := by native_decide
example : isArticleSubLabel "第九条の十八" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第九条の十八" := by native_decide
example : isArticleSubLabel "第九条の十六" = true := by native_decide
example : isArticleSubLabel "第九条の十六" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第九条の十六" := by native_decide
example : isArticleSubLabel "第九条の十四" = true := by native_decide
example : isArticleSubLabel "第九条の十四" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第九条の十四" := by native_decide
example : isArticleSubLabel "第九条の四" = true := by native_decide
example : isArticleSubLabel "第九条の四" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第九条の四" := by native_decide
example : isArticleSubLabel "第二十一条の七" = true := by native_decide
example : isArticleSubLabel "第二十一条の七" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第二十一条の七" := by native_decide
example : isArticleSubLabel "第二十一条の九" = true := by native_decide
example : isArticleSubLabel "第二十一条の九" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第二十一条の九" := by native_decide
example : isArticleSubLabel "第二十一条の五" = true := by native_decide
example : isArticleSubLabel "第二十一条の五" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第二十一条の五" := by native_decide
example : isArticleSubLabel "第二十一条の八" = true := by native_decide
example : isArticleSubLabel "第二十一条の八" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第二十一条の八" := by native_decide
example : isArticleSubLabel "第二十一条の六" = true := by native_decide
example : isArticleSubLabel "第二十一条の六" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第二十一条の六" := by native_decide
example : isArticleSubLabel "第二十一条の十" = true := by native_decide
example : isArticleSubLabel "第二十一条の十" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第二十一条の十" := by native_decide
example : isArticleSubLabel "第二十一条の十一" = true := by native_decide
example : isArticleSubLabel "第二十一条の十一" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第二十一条の十一" := by native_decide
example : isArticleSubLabel "第二十一条の十七" = true := by native_decide
example : isArticleSubLabel "第二十一条の十七" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第二十一条の十七" := by native_decide
example : isArticleSubLabel "第二十一条の十三" = true := by native_decide
example : isArticleSubLabel "第二十一条の十三" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第二十一条の十三" := by native_decide
example : isArticleSubLabel "第二十一条の十九" = true := by native_decide
example : isArticleSubLabel "第二十一条の十九" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第二十一条の十九" := by native_decide
example : isArticleSubLabel "第二十一条の十二" = true := by native_decide
example : isArticleSubLabel "第二十一条の十二" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第二十一条の十二" := by native_decide
example : isArticleSubLabel "第二十一条の十五" = true := by native_decide
example : isArticleSubLabel "第二十一条の十五" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第二十一条の十五" := by native_decide
example : isArticleSubLabel "第二十一条の十八" = true := by native_decide
example : isArticleSubLabel "第二十一条の十八" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第二十一条の十八" := by native_decide
example : isArticleSubLabel "第二十一条の十六" = true := by native_decide
example : isArticleSubLabel "第二十一条の十六" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第二十一条の十六" := by native_decide
example : isArticleSubLabel "第二十一条の十四" = true := by native_decide
example : isArticleSubLabel "第二十一条の十四" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第二十一条の十四" := by native_decide
example : isArticleSubLabel "第二十一条の四" = true := by native_decide
example : isArticleSubLabel "第二十一条の四" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第二十一条の四" := by native_decide
example : isArticleSubLabel "第二十七条の七" = true := by native_decide
example : isArticleSubLabel "第二十七条の七" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第二十七条の七" := by native_decide
example : isArticleSubLabel "第二十七条の九" = true := by native_decide
example : isArticleSubLabel "第二十七条の九" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第二十七条の九" := by native_decide
example : isArticleSubLabel "第二十七条の五" = true := by native_decide
example : isArticleSubLabel "第二十七条の五" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第二十七条の五" := by native_decide
example : isArticleSubLabel "第二十七条の八" = true := by native_decide
example : isArticleSubLabel "第二十七条の八" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第二十七条の八" := by native_decide
example : isArticleSubLabel "第二十七条の六" = true := by native_decide
example : isArticleSubLabel "第二十七条の六" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第二十七条の六" := by native_decide
example : isArticleSubLabel "第二十七条の十" = true := by native_decide
example : isArticleSubLabel "第二十七条の十" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第二十七条の十" := by native_decide
example : isArticleSubLabel "第二十七条の十一" = true := by native_decide
example : isArticleSubLabel "第二十七条の十一" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第二十七条の十一" := by native_decide
example : isArticleSubLabel "第二十七条の十七" = true := by native_decide
example : isArticleSubLabel "第二十七条の十七" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第二十七条の十七" := by native_decide
example : isArticleSubLabel "第二十七条の十三" = true := by native_decide
example : isArticleSubLabel "第二十七条の十三" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第二十七条の十三" := by native_decide
example : isArticleSubLabel "第二十七条の十九" = true := by native_decide
example : isArticleSubLabel "第二十七条の十九" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第二十七条の十九" := by native_decide
example : isArticleSubLabel "第二十七条の十二" = true := by native_decide
example : isArticleSubLabel "第二十七条の十二" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第二十七条の十二" := by native_decide
example : isArticleSubLabel "第二十七条の十五" = true := by native_decide
example : isArticleSubLabel "第二十七条の十五" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第二十七条の十五" := by native_decide
example : isArticleSubLabel "第二十七条の十八" = true := by native_decide
example : isArticleSubLabel "第二十七条の十八" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第二十七条の十八" := by native_decide
example : isArticleSubLabel "第二十七条の十六" = true := by native_decide
example : isArticleSubLabel "第二十七条の十六" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第二十七条の十六" := by native_decide
example : isArticleSubLabel "第二十七条の十四" = true := by native_decide
example : isArticleSubLabel "第二十七条の十四" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第二十七条の十四" := by native_decide
example : isArticleSubLabel "第二十七条の四" = true := by native_decide
example : isArticleSubLabel "第二十七条の四" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第二十七条の四" := by native_decide
example : isArticleSubLabel "第二十三条の七" = true := by native_decide
example : isArticleSubLabel "第二十三条の七" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第二十三条の七" := by native_decide
example : isArticleSubLabel "第二十三条の九" = true := by native_decide
example : isArticleSubLabel "第二十三条の九" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第二十三条の九" := by native_decide
example : isArticleSubLabel "第二十三条の五" = true := by native_decide
example : isArticleSubLabel "第二十三条の五" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第二十三条の五" := by native_decide
example : isArticleSubLabel "第二十三条の八" = true := by native_decide
example : isArticleSubLabel "第二十三条の八" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第二十三条の八" := by native_decide
example : isArticleSubLabel "第二十三条の六" = true := by native_decide
example : isArticleSubLabel "第二十三条の六" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第二十三条の六" := by native_decide
example : isArticleSubLabel "第二十三条の十" = true := by native_decide
example : isArticleSubLabel "第二十三条の十" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第二十三条の十" := by native_decide
example : isArticleSubLabel "第二十三条の十一" = true := by native_decide
example : isArticleSubLabel "第二十三条の十一" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第二十三条の十一" := by native_decide
example : isArticleSubLabel "第二十三条の十七" = true := by native_decide
example : isArticleSubLabel "第二十三条の十七" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第二十三条の十七" := by native_decide
example : isArticleSubLabel "第二十三条の十三" = true := by native_decide
example : isArticleSubLabel "第二十三条の十三" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第二十三条の十三" := by native_decide
example : isArticleSubLabel "第二十三条の十二" = true := by native_decide
example : isArticleSubLabel "第二十三条の十二" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第二十三条の十二" := by native_decide
example : isArticleSubLabel "第二十三条の十五" = true := by native_decide
example : isArticleSubLabel "第二十三条の十五" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第二十三条の十五" := by native_decide
example : isArticleSubLabel "第二十三条の十六" = true := by native_decide
example : isArticleSubLabel "第二十三条の十六" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第二十三条の十六" := by native_decide
example : isArticleSubLabel "第二十三条の十四" = true := by native_decide
example : isArticleSubLabel "第二十三条の十四" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第二十三条の十四" := by native_decide
example : isArticleSubLabel "第二十三条の四" = true := by native_decide
example : isArticleSubLabel "第二十三条の四" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第二十三条の四" := by native_decide
example : isArticleSubLabel "第二十九条の七" = true := by native_decide
example : isArticleSubLabel "第二十九条の七" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第二十九条の七" := by native_decide
example : isArticleSubLabel "第二十九条の五" = true := by native_decide
example : isArticleSubLabel "第二十九条の五" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第二十九条の五" := by native_decide
example : isArticleSubLabel "第二十九条の八" = true := by native_decide
example : isArticleSubLabel "第二十九条の八" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第二十九条の八" := by native_decide
example : isArticleSubLabel "第二十九条の六" = true := by native_decide
example : isArticleSubLabel "第二十九条の六" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第二十九条の六" := by native_decide
example : isArticleSubLabel "第二十九条の四" = true := by native_decide
example : isArticleSubLabel "第二十九条の四" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第二十九条の四" := by native_decide
example : isArticleSubLabel "第二十二条の七" = true := by native_decide
example : isArticleSubLabel "第二十二条の七" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第二十二条の七" := by native_decide
example : isArticleSubLabel "第二十二条の九" = true := by native_decide
example : isArticleSubLabel "第二十二条の九" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第二十二条の九" := by native_decide
example : isArticleSubLabel "第二十二条の五" = true := by native_decide
example : isArticleSubLabel "第二十二条の五" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第二十二条の五" := by native_decide
example : isArticleSubLabel "第二十二条の八" = true := by native_decide
example : isArticleSubLabel "第二十二条の八" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第二十二条の八" := by native_decide
example : isArticleSubLabel "第二十二条の六" = true := by native_decide
example : isArticleSubLabel "第二十二条の六" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第二十二条の六" := by native_decide
example : isArticleSubLabel "第二十二条の十" = true := by native_decide
example : isArticleSubLabel "第二十二条の十" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第二十二条の十" := by native_decide
example : isArticleSubLabel "第二十二条の十一" = true := by native_decide
example : isArticleSubLabel "第二十二条の十一" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第二十二条の十一" := by native_decide
example : isArticleSubLabel "第二十二条の十七" = true := by native_decide
example : isArticleSubLabel "第二十二条の十七" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第二十二条の十七" := by native_decide
example : isArticleSubLabel "第二十二条の十三" = true := by native_decide
example : isArticleSubLabel "第二十二条の十三" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第二十二条の十三" := by native_decide
example : isArticleSubLabel "第二十二条の十九" = true := by native_decide
example : isArticleSubLabel "第二十二条の十九" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第二十二条の十九" := by native_decide
example : isArticleSubLabel "第二十二条の十二" = true := by native_decide
example : isArticleSubLabel "第二十二条の十二" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第二十二条の十二" := by native_decide
example : isArticleSubLabel "第二十二条の十五" = true := by native_decide
example : isArticleSubLabel "第二十二条の十五" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第二十二条の十五" := by native_decide
example : isArticleSubLabel "第二十二条の十八" = true := by native_decide
example : isArticleSubLabel "第二十二条の十八" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第二十二条の十八" := by native_decide
example : isArticleSubLabel "第二十二条の十六" = true := by native_decide
example : isArticleSubLabel "第二十二条の十六" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第二十二条の十六" := by native_decide
example : isArticleSubLabel "第二十二条の十四" = true := by native_decide
example : isArticleSubLabel "第二十二条の十四" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第二十二条の十四" := by native_decide
example : isArticleSubLabel "第二十二条の四" = true := by native_decide
example : isArticleSubLabel "第二十二条の四" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第二十二条の四" := by native_decide
example : isArticleSubLabel "第二十五条の七" = true := by native_decide
example : isArticleSubLabel "第二十五条の七" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第二十五条の七" := by native_decide
example : isArticleSubLabel "第二十五条の九" = true := by native_decide
example : isArticleSubLabel "第二十五条の九" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第二十五条の九" := by native_decide
example : isArticleSubLabel "第二十五条の五" = true := by native_decide
example : isArticleSubLabel "第二十五条の五" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第二十五条の五" := by native_decide
example : isArticleSubLabel "第二十五条の八" = true := by native_decide
example : isArticleSubLabel "第二十五条の八" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第二十五条の八" := by native_decide
example : isArticleSubLabel "第二十五条の六" = true := by native_decide
example : isArticleSubLabel "第二十五条の六" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第二十五条の六" := by native_decide
example : isArticleSubLabel "第二十五条の十" = true := by native_decide
example : isArticleSubLabel "第二十五条の十" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第二十五条の十" := by native_decide
example : isArticleSubLabel "第二十五条の十一" = true := by native_decide
example : isArticleSubLabel "第二十五条の十一" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第二十五条の十一" := by native_decide
example : isArticleSubLabel "第二十五条の十七" = true := by native_decide
example : isArticleSubLabel "第二十五条の十七" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第二十五条の十七" := by native_decide
example : isArticleSubLabel "第二十五条の十三" = true := by native_decide
example : isArticleSubLabel "第二十五条の十三" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第二十五条の十三" := by native_decide
example : isArticleSubLabel "第二十五条の十九" = true := by native_decide
example : isArticleSubLabel "第二十五条の十九" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第二十五条の十九" := by native_decide
example : isArticleSubLabel "第二十五条の十二" = true := by native_decide
example : isArticleSubLabel "第二十五条の十二" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第二十五条の十二" := by native_decide
example : isArticleSubLabel "第二十五条の十五" = true := by native_decide
example : isArticleSubLabel "第二十五条の十五" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第二十五条の十五" := by native_decide
example : isArticleSubLabel "第二十五条の十八" = true := by native_decide
example : isArticleSubLabel "第二十五条の十八" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第二十五条の十八" := by native_decide
example : isArticleSubLabel "第二十五条の十六" = true := by native_decide
example : isArticleSubLabel "第二十五条の十六" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第二十五条の十六" := by native_decide
example : isArticleSubLabel "第二十五条の十四" = true := by native_decide
example : isArticleSubLabel "第二十五条の十四" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第二十五条の十四" := by native_decide
example : isArticleSubLabel "第二十五条の四" = true := by native_decide
example : isArticleSubLabel "第二十五条の四" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第二十五条の四" := by native_decide
example : isArticleSubLabel "第二十八条の七" = true := by native_decide
example : isArticleSubLabel "第二十八条の七" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第二十八条の七" := by native_decide
example : isArticleSubLabel "第二十八条の九" = true := by native_decide
example : isArticleSubLabel "第二十八条の九" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第二十八条の九" := by native_decide
example : isArticleSubLabel "第二十八条の五" = true := by native_decide
example : isArticleSubLabel "第二十八条の五" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第二十八条の五" := by native_decide
example : isArticleSubLabel "第二十八条の八" = true := by native_decide
example : isArticleSubLabel "第二十八条の八" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第二十八条の八" := by native_decide
example : isArticleSubLabel "第二十八条の六" = true := by native_decide
example : isArticleSubLabel "第二十八条の六" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第二十八条の六" := by native_decide
example : isArticleSubLabel "第二十八条の十" = true := by native_decide
example : isArticleSubLabel "第二十八条の十" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第二十八条の十" := by native_decide
example : isArticleSubLabel "第二十八条の十一" = true := by native_decide
example : isArticleSubLabel "第二十八条の十一" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第二十八条の十一" := by native_decide
example : isArticleSubLabel "第二十八条の四" = true := by native_decide
example : isArticleSubLabel "第二十八条の四" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第二十八条の四" := by native_decide
example : isArticleSubLabel "第二十六条の七" = true := by native_decide
example : isArticleSubLabel "第二十六条の七" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第二十六条の七" := by native_decide
example : isArticleSubLabel "第二十六条の九" = true := by native_decide
example : isArticleSubLabel "第二十六条の九" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第二十六条の九" := by native_decide
example : isArticleSubLabel "第二十六条の五" = true := by native_decide
example : isArticleSubLabel "第二十六条の五" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第二十六条の五" := by native_decide
example : isArticleSubLabel "第二十六条の八" = true := by native_decide
example : isArticleSubLabel "第二十六条の八" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第二十六条の八" := by native_decide
example : isArticleSubLabel "第二十六条の六" = true := by native_decide
example : isArticleSubLabel "第二十六条の六" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第二十六条の六" := by native_decide
example : isArticleSubLabel "第二十六条の十" = true := by native_decide
example : isArticleSubLabel "第二十六条の十" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第二十六条の十" := by native_decide
example : isArticleSubLabel "第二十六条の十一" = true := by native_decide
example : isArticleSubLabel "第二十六条の十一" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第二十六条の十一" := by native_decide
example : isArticleSubLabel "第二十六条の十七" = true := by native_decide
example : isArticleSubLabel "第二十六条の十七" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第二十六条の十七" := by native_decide
example : isArticleSubLabel "第二十六条の十三" = true := by native_decide
example : isArticleSubLabel "第二十六条の十三" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第二十六条の十三" := by native_decide
example : isArticleSubLabel "第二十六条の十九" = true := by native_decide
example : isArticleSubLabel "第二十六条の十九" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第二十六条の十九" := by native_decide
example : isArticleSubLabel "第二十六条の十二" = true := by native_decide
example : isArticleSubLabel "第二十六条の十二" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第二十六条の十二" := by native_decide
example : isArticleSubLabel "第二十六条の十五" = true := by native_decide
example : isArticleSubLabel "第二十六条の十五" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第二十六条の十五" := by native_decide
example : isArticleSubLabel "第二十六条の十八" = true := by native_decide
example : isArticleSubLabel "第二十六条の十八" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第二十六条の十八" := by native_decide
example : isArticleSubLabel "第二十六条の十六" = true := by native_decide
example : isArticleSubLabel "第二十六条の十六" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第二十六条の十六" := by native_decide
example : isArticleSubLabel "第二十六条の十四" = true := by native_decide
example : isArticleSubLabel "第二十六条の十四" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第二十六条の十四" := by native_decide
example : isArticleSubLabel "第二十六条の四" = true := by native_decide
example : isArticleSubLabel "第二十六条の四" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第二十六条の四" := by native_decide
example : isArticleSubLabel "第二十四条の七" = true := by native_decide
example : isArticleSubLabel "第二十四条の七" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第二十四条の七" := by native_decide
example : isArticleSubLabel "第二十四条の九" = true := by native_decide
example : isArticleSubLabel "第二十四条の九" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第二十四条の九" := by native_decide
example : isArticleSubLabel "第二十四条の五" = true := by native_decide
example : isArticleSubLabel "第二十四条の五" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第二十四条の五" := by native_decide
example : isArticleSubLabel "第二十四条の五十" = true := by native_decide
example : isArticleSubLabel "第二十四条の五十" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第二十四条の五十" := by native_decide
example : isArticleSubLabel "第二十四条の五十一" = true := by native_decide
example : isArticleSubLabel "第二十四条の五十一" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第二十四条の五十一" := by native_decide
example : isArticleSubLabel "第二十四条の五十三" = true := by native_decide
example : isArticleSubLabel "第二十四条の五十三" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第二十四条の五十三" := by native_decide
example : isArticleSubLabel "第二十四条の五十二" = true := by native_decide
example : isArticleSubLabel "第二十四条の五十二" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第二十四条の五十二" := by native_decide
example : isArticleSubLabel "第二十四条の五十四" = true := by native_decide
example : isArticleSubLabel "第二十四条の五十四" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第二十四条の五十四" := by native_decide
example : isArticleSubLabel "第二十四条の八" = true := by native_decide
example : isArticleSubLabel "第二十四条の八" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第二十四条の八" := by native_decide
example : isArticleSubLabel "第二十四条の六" = true := by native_decide
example : isArticleSubLabel "第二十四条の六" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第二十四条の六" := by native_decide
example : isArticleSubLabel "第二十四条の十" = true := by native_decide
example : isArticleSubLabel "第二十四条の十" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第二十四条の十" := by native_decide
example : isArticleSubLabel "第二十四条の十一" = true := by native_decide
example : isArticleSubLabel "第二十四条の十一" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第二十四条の十一" := by native_decide
example : isArticleSubLabel "第二十四条の十三" = true := by native_decide
example : isArticleSubLabel "第二十四条の十三" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第二十四条の十三" := by native_decide
example : isArticleSubLabel "第二十四条の十九" = true := by native_decide
example : isArticleSubLabel "第二十四条の十九" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第二十四条の十九" := by native_decide
example : isArticleSubLabel "第二十四条の十二" = true := by native_decide
example : isArticleSubLabel "第二十四条の十二" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第二十四条の十二" := by native_decide
example : isArticleSubLabel "第二十四条の十五" = true := by native_decide
example : isArticleSubLabel "第二十四条の十五" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第二十四条の十五" := by native_decide
example : isArticleSubLabel "第二十四条の十四" = true := by native_decide
example : isArticleSubLabel "第二十四条の十四" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第二十四条の十四" := by native_decide
example : isArticleSubLabel "第二十四条の四" = true := by native_decide
example : isArticleSubLabel "第二十四条の四" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第二十四条の四" := by native_decide
example : isArticleSubLabel "第二十四条の四十" = true := by native_decide
example : isArticleSubLabel "第二十四条の四十" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第二十四条の四十" := by native_decide
example : isArticleSubLabel "第二十四条の四十一" = true := by native_decide
example : isArticleSubLabel "第二十四条の四十一" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第二十四条の四十一" := by native_decide
example : isArticleSubLabel "第二十四条の四十七" = true := by native_decide
example : isArticleSubLabel "第二十四条の四十七" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第二十四条の四十七" := by native_decide
example : isArticleSubLabel "第二十四条の四十三" = true := by native_decide
example : isArticleSubLabel "第二十四条の四十三" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第二十四条の四十三" := by native_decide
example : isArticleSubLabel "第二十四条の四十九" = true := by native_decide
example : isArticleSubLabel "第二十四条の四十九" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第二十四条の四十九" := by native_decide
example : isArticleSubLabel "第二十四条の四十二" = true := by native_decide
example : isArticleSubLabel "第二十四条の四十二" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第二十四条の四十二" := by native_decide
example : isArticleSubLabel "第二十四条の四十五" = true := by native_decide
example : isArticleSubLabel "第二十四条の四十五" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第二十四条の四十五" := by native_decide
example : isArticleSubLabel "第二十四条の四十八" = true := by native_decide
example : isArticleSubLabel "第二十四条の四十八" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第二十四条の四十八" := by native_decide
example : isArticleSubLabel "第二十四条の四十六" = true := by native_decide
example : isArticleSubLabel "第二十四条の四十六" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第二十四条の四十六" := by native_decide
example : isArticleSubLabel "第二十四条の四十四" = true := by native_decide
example : isArticleSubLabel "第二十四条の四十四" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第二十四条の四十四" := by native_decide
example : isArticleSubLabel "第二十条の七" = true := by native_decide
example : isArticleSubLabel "第二十条の七" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第二十条の七" := by native_decide
example : isArticleSubLabel "第二十条の九" = true := by native_decide
example : isArticleSubLabel "第二十条の九" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第二十条の九" := by native_decide
example : isArticleSubLabel "第二十条の五" = true := by native_decide
example : isArticleSubLabel "第二十条の五" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第二十条の五" := by native_decide
example : isArticleSubLabel "第二十条の八" = true := by native_decide
example : isArticleSubLabel "第二十条の八" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第二十条の八" := by native_decide
example : isArticleSubLabel "第二十条の六" = true := by native_decide
example : isArticleSubLabel "第二十条の六" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第二十条の六" := by native_decide
example : isArticleSubLabel "第二十条の十" = true := by native_decide
example : isArticleSubLabel "第二十条の十" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第二十条の十" := by native_decide
example : isArticleSubLabel "第二十条の十一" = true := by native_decide
example : isArticleSubLabel "第二十条の十一" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第二十条の十一" := by native_decide
example : isArticleSubLabel "第二十条の十七" = true := by native_decide
example : isArticleSubLabel "第二十条の十七" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第二十条の十七" := by native_decide
example : isArticleSubLabel "第二十条の十三" = true := by native_decide
example : isArticleSubLabel "第二十条の十三" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第二十条の十三" := by native_decide
example : isArticleSubLabel "第二十条の十二" = true := by native_decide
example : isArticleSubLabel "第二十条の十二" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第二十条の十二" := by native_decide
example : isArticleSubLabel "第二十条の十六" = true := by native_decide
example : isArticleSubLabel "第二十条の十六" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第二十条の十六" := by native_decide
example : isArticleSubLabel "第二十条の四" = true := by native_decide
example : isArticleSubLabel "第二十条の四" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第二十条の四" := by native_decide
example : isArticleSubLabel "第二条の七" = true := by native_decide
example : isArticleSubLabel "第二条の七" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第二条の七" := by native_decide
example : isArticleSubLabel "第二条の九" = true := by native_decide
example : isArticleSubLabel "第二条の九" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第二条の九" := by native_decide
example : isArticleSubLabel "第二条の五" = true := by native_decide
example : isArticleSubLabel "第二条の五" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第二条の五" := by native_decide
example : isArticleSubLabel "第二条の八" = true := by native_decide
example : isArticleSubLabel "第二条の八" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第二条の八" := by native_decide
example : isArticleSubLabel "第二条の六" = true := by native_decide
example : isArticleSubLabel "第二条の六" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第二条の六" := by native_decide
example : isArticleSubLabel "第二条の十" = true := by native_decide
example : isArticleSubLabel "第二条の十" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第二条の十" := by native_decide
example : isArticleSubLabel "第二条の十一" = true := by native_decide
example : isArticleSubLabel "第二条の十一" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第二条の十一" := by native_decide
example : isArticleSubLabel "第二条の十七" = true := by native_decide
example : isArticleSubLabel "第二条の十七" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第二条の十七" := by native_decide
example : isArticleSubLabel "第二条の十三" = true := by native_decide
example : isArticleSubLabel "第二条の十三" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第二条の十三" := by native_decide
example : isArticleSubLabel "第二条の十九" = true := by native_decide
example : isArticleSubLabel "第二条の十九" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第二条の十九" := by native_decide
example : isArticleSubLabel "第二条の十二" = true := by native_decide
example : isArticleSubLabel "第二条の十二" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第二条の十二" := by native_decide
example : isArticleSubLabel "第二条の十五" = true := by native_decide
example : isArticleSubLabel "第二条の十五" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第二条の十五" := by native_decide
example : isArticleSubLabel "第二条の十八" = true := by native_decide
example : isArticleSubLabel "第二条の十八" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第二条の十八" := by native_decide
example : isArticleSubLabel "第二条の十六" = true := by native_decide
example : isArticleSubLabel "第二条の十六" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第二条の十六" := by native_decide
example : isArticleSubLabel "第二条の十四" = true := by native_decide
example : isArticleSubLabel "第二条の十四" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第二条の十四" := by native_decide
example : isArticleSubLabel "第二条の四" = true := by native_decide
example : isArticleSubLabel "第二条の四" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第二条の四" := by native_decide
example : isArticleSubLabel "第二百三条の七" = true := by native_decide
example : isArticleSubLabel "第二百三条の七" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第二百三条の七" := by native_decide
example : isArticleSubLabel "第二百三条の五" = true := by native_decide
example : isArticleSubLabel "第二百三条の五" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第二百三条の五" := by native_decide
example : isArticleSubLabel "第二百三条の六" = true := by native_decide
example : isArticleSubLabel "第二百三条の六" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第二百三条の六" := by native_decide
example : isArticleSubLabel "第二百三条の四" = true := by native_decide
example : isArticleSubLabel "第二百三条の四" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第二百三条の四" := by native_decide
example : isArticleSubLabel "第二百九十二条の七" = true := by native_decide
example : isArticleSubLabel "第二百九十二条の七" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第二百九十二条の七" := by native_decide
example : isArticleSubLabel "第二百九十二条の九" = true := by native_decide
example : isArticleSubLabel "第二百九十二条の九" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第二百九十二条の九" := by native_decide
example : isArticleSubLabel "第二百九十二条の五" = true := by native_decide
example : isArticleSubLabel "第二百九十二条の五" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第二百九十二条の五" := by native_decide
example : isArticleSubLabel "第二百九十二条の八" = true := by native_decide
example : isArticleSubLabel "第二百九十二条の八" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第二百九十二条の八" := by native_decide
example : isArticleSubLabel "第二百九十二条の六" = true := by native_decide
example : isArticleSubLabel "第二百九十二条の六" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第二百九十二条の六" := by native_decide
example : isArticleSubLabel "第二百九十二条の十" = true := by native_decide
example : isArticleSubLabel "第二百九十二条の十" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第二百九十二条の十" := by native_decide
example : isArticleSubLabel "第二百九十二条の十一" = true := by native_decide
example : isArticleSubLabel "第二百九十二条の十一" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第二百九十二条の十一" := by native_decide
example : isArticleSubLabel "第二百九十二条の十三" = true := by native_decide
example : isArticleSubLabel "第二百九十二条の十三" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第二百九十二条の十三" := by native_decide
example : isArticleSubLabel "第二百九十二条の十二" = true := by native_decide
example : isArticleSubLabel "第二百九十二条の十二" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第二百九十二条の十二" := by native_decide
example : isArticleSubLabel "第二百九十二条の十四" = true := by native_decide
example : isArticleSubLabel "第二百九十二条の十四" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第二百九十二条の十四" := by native_decide
example : isArticleSubLabel "第二百九十二条の四" = true := by native_decide
example : isArticleSubLabel "第二百九十二条の四" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第二百九十二条の四" := by native_decide
example : isArticleSubLabel "第二百二十一条の五" = true := by native_decide
example : isArticleSubLabel "第二百二十一条の五" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第二百二十一条の五" := by native_decide
example : isArticleSubLabel "第二百二十一条の六" = true := by native_decide
example : isArticleSubLabel "第二百二十一条の六" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第二百二十一条の六" := by native_decide
example : isArticleSubLabel "第二百二十一条の四" = true := by native_decide
example : isArticleSubLabel "第二百二十一条の四" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第二百二十一条の四" := by native_decide
example : isArticleSubLabel "第二百二十五条の七" = true := by native_decide
example : isArticleSubLabel "第二百二十五条の七" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第二百二十五条の七" := by native_decide
example : isArticleSubLabel "第二百二十五条の九" = true := by native_decide
example : isArticleSubLabel "第二百二十五条の九" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第二百二十五条の九" := by native_decide
example : isArticleSubLabel "第二百二十五条の五" = true := by native_decide
example : isArticleSubLabel "第二百二十五条の五" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第二百二十五条の五" := by native_decide
example : isArticleSubLabel "第二百二十五条の八" = true := by native_decide
example : isArticleSubLabel "第二百二十五条の八" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第二百二十五条の八" := by native_decide
example : isArticleSubLabel "第二百二十五条の六" = true := by native_decide
example : isArticleSubLabel "第二百二十五条の六" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第二百二十五条の六" := by native_decide
example : isArticleSubLabel "第二百二十五条の十" = true := by native_decide
example : isArticleSubLabel "第二百二十五条の十" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第二百二十五条の十" := by native_decide
example : isArticleSubLabel "第二百二十五条の十一" = true := by native_decide
example : isArticleSubLabel "第二百二十五条の十一" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第二百二十五条の十一" := by native_decide
example : isArticleSubLabel "第二百二十五条の十三" = true := by native_decide
example : isArticleSubLabel "第二百二十五条の十三" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第二百二十五条の十三" := by native_decide
example : isArticleSubLabel "第二百二十五条の十二" = true := by native_decide
example : isArticleSubLabel "第二百二十五条の十二" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第二百二十五条の十二" := by native_decide
example : isArticleSubLabel "第二百二十五条の十五" = true := by native_decide
example : isArticleSubLabel "第二百二十五条の十五" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第二百二十五条の十五" := by native_decide
example : isArticleSubLabel "第二百二十五条の十六" = true := by native_decide
example : isArticleSubLabel "第二百二十五条の十六" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第二百二十五条の十六" := by native_decide
example : isArticleSubLabel "第二百二十五条の十四" = true := by native_decide
example : isArticleSubLabel "第二百二十五条の十四" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第二百二十五条の十四" := by native_decide
example : isArticleSubLabel "第二百二十五条の四" = true := by native_decide
example : isArticleSubLabel "第二百二十五条の四" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第二百二十五条の四" := by native_decide
example : isArticleSubLabel "第二百二十八条の四" = true := by native_decide
example : isArticleSubLabel "第二百二十八条の四" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第二百二十八条の四" := by native_decide
example : isArticleSubLabel "第二百二十四条の五" = true := by native_decide
example : isArticleSubLabel "第二百二十四条の五" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第二百二十四条の五" := by native_decide
example : isArticleSubLabel "第二百二十四条の六" = true := by native_decide
example : isArticleSubLabel "第二百二十四条の六" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第二百二十四条の六" := by native_decide
example : isArticleSubLabel "第二百二十四条の四" = true := by native_decide
example : isArticleSubLabel "第二百二十四条の四" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第二百二十四条の四" := by native_decide
example : isArticleSubLabel "第二百八条の七" = true := by native_decide
example : isArticleSubLabel "第二百八条の七" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第二百八条の七" := by native_decide
example : isArticleSubLabel "第二百八条の五" = true := by native_decide
example : isArticleSubLabel "第二百八条の五" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第二百八条の五" := by native_decide
example : isArticleSubLabel "第二百八条の八" = true := by native_decide
example : isArticleSubLabel "第二百八条の八" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第二百八条の八" := by native_decide
example : isArticleSubLabel "第二百八条の六" = true := by native_decide
example : isArticleSubLabel "第二百八条の六" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第二百八条の六" := by native_decide
example : isArticleSubLabel "第二百八条の四" = true := by native_decide
example : isArticleSubLabel "第二百八条の四" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第二百八条の四" := by native_decide
example : isArticleSubLabel "第五十一条の七" = true := by native_decide
example : isArticleSubLabel "第五十一条の七" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第五十一条の七" := by native_decide
example : isArticleSubLabel "第五十一条の九" = true := by native_decide
example : isArticleSubLabel "第五十一条の九" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第五十一条の九" := by native_decide
example : isArticleSubLabel "第五十一条の五" = true := by native_decide
example : isArticleSubLabel "第五十一条の五" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第五十一条の五" := by native_decide
example : isArticleSubLabel "第五十一条の八" = true := by native_decide
example : isArticleSubLabel "第五十一条の八" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第五十一条の八" := by native_decide
example : isArticleSubLabel "第五十一条の六" = true := by native_decide
example : isArticleSubLabel "第五十一条の六" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第五十一条の六" := by native_decide
example : isArticleSubLabel "第五十一条の十" = true := by native_decide
example : isArticleSubLabel "第五十一条の十" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第五十一条の十" := by native_decide
example : isArticleSubLabel "第五十一条の十一" = true := by native_decide
example : isArticleSubLabel "第五十一条の十一" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第五十一条の十一" := by native_decide
example : isArticleSubLabel "第五十一条の十三" = true := by native_decide
example : isArticleSubLabel "第五十一条の十三" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第五十一条の十三" := by native_decide
example : isArticleSubLabel "第五十一条の十二" = true := by native_decide
example : isArticleSubLabel "第五十一条の十二" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第五十一条の十二" := by native_decide
example : isArticleSubLabel "第五十一条の十五" = true := by native_decide
example : isArticleSubLabel "第五十一条の十五" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第五十一条の十五" := by native_decide
example : isArticleSubLabel "第五十一条の十六" = true := by native_decide
example : isArticleSubLabel "第五十一条の十六" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第五十一条の十六" := by native_decide
example : isArticleSubLabel "第五十一条の十四" = true := by native_decide
example : isArticleSubLabel "第五十一条の十四" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第五十一条の十四" := by native_decide
example : isArticleSubLabel "第五十一条の四" = true := by native_decide
example : isArticleSubLabel "第五十一条の四" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第五十一条の四" := by native_decide
example : isArticleSubLabel "第五十七条の七" = true := by native_decide
example : isArticleSubLabel "第五十七条の七" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第五十七条の七" := by native_decide
example : isArticleSubLabel "第五十七条の九" = true := by native_decide
example : isArticleSubLabel "第五十七条の九" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第五十七条の九" := by native_decide
example : isArticleSubLabel "第五十七条の五" = true := by native_decide
example : isArticleSubLabel "第五十七条の五" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第五十七条の五" := by native_decide
example : isArticleSubLabel "第五十七条の八" = true := by native_decide
example : isArticleSubLabel "第五十七条の八" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第五十七条の八" := by native_decide
example : isArticleSubLabel "第五十七条の六" = true := by native_decide
example : isArticleSubLabel "第五十七条の六" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第五十七条の六" := by native_decide
example : isArticleSubLabel "第五十七条の四" = true := by native_decide
example : isArticleSubLabel "第五十七条の四" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第五十七条の四" := by native_decide
example : isArticleSubLabel "第五十三条の七" = true := by native_decide
example : isArticleSubLabel "第五十三条の七" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第五十三条の七" := by native_decide
example : isArticleSubLabel "第五十三条の九" = true := by native_decide
example : isArticleSubLabel "第五十三条の九" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第五十三条の九" := by native_decide
example : isArticleSubLabel "第五十三条の五" = true := by native_decide
example : isArticleSubLabel "第五十三条の五" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第五十三条の五" := by native_decide
example : isArticleSubLabel "第五十三条の八" = true := by native_decide
example : isArticleSubLabel "第五十三条の八" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第五十三条の八" := by native_decide
example : isArticleSubLabel "第五十三条の六" = true := by native_decide
example : isArticleSubLabel "第五十三条の六" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第五十三条の六" := by native_decide
example : isArticleSubLabel "第五十三条の四" = true := by native_decide
example : isArticleSubLabel "第五十三条の四" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第五十三条の四" := by native_decide
example : isArticleSubLabel "第五十九条の七" = true := by native_decide
example : isArticleSubLabel "第五十九条の七" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第五十九条の七" := by native_decide
example : isArticleSubLabel "第五十九条の九" = true := by native_decide
example : isArticleSubLabel "第五十九条の九" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第五十九条の九" := by native_decide
example : isArticleSubLabel "第五十九条の五" = true := by native_decide
example : isArticleSubLabel "第五十九条の五" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第五十九条の五" := by native_decide
example : isArticleSubLabel "第五十九条の八" = true := by native_decide
example : isArticleSubLabel "第五十九条の八" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第五十九条の八" := by native_decide
example : isArticleSubLabel "第五十九条の六" = true := by native_decide
example : isArticleSubLabel "第五十九条の六" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第五十九条の六" := by native_decide
example : isArticleSubLabel "第五十九条の十" = true := by native_decide
example : isArticleSubLabel "第五十九条の十" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第五十九条の十" := by native_decide
example : isArticleSubLabel "第五十九条の十一" = true := by native_decide
example : isArticleSubLabel "第五十九条の十一" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第五十九条の十一" := by native_decide
example : isArticleSubLabel "第五十九条の十七" = true := by native_decide
example : isArticleSubLabel "第五十九条の十七" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第五十九条の十七" := by native_decide
example : isArticleSubLabel "第五十九条の十三" = true := by native_decide
example : isArticleSubLabel "第五十九条の十三" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第五十九条の十三" := by native_decide
example : isArticleSubLabel "第五十九条の十九" = true := by native_decide
example : isArticleSubLabel "第五十九条の十九" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第五十九条の十九" := by native_decide
example : isArticleSubLabel "第五十九条の十二" = true := by native_decide
example : isArticleSubLabel "第五十九条の十二" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第五十九条の十二" := by native_decide
example : isArticleSubLabel "第五十九条の十五" = true := by native_decide
example : isArticleSubLabel "第五十九条の十五" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第五十九条の十五" := by native_decide
example : isArticleSubLabel "第五十九条の十八" = true := by native_decide
example : isArticleSubLabel "第五十九条の十八" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第五十九条の十八" := by native_decide
example : isArticleSubLabel "第五十九条の十六" = true := by native_decide
example : isArticleSubLabel "第五十九条の十六" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第五十九条の十六" := by native_decide
example : isArticleSubLabel "第五十九条の十四" = true := by native_decide
example : isArticleSubLabel "第五十九条の十四" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第五十九条の十四" := by native_decide
example : isArticleSubLabel "第五十九条の四" = true := by native_decide
example : isArticleSubLabel "第五十九条の四" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第五十九条の四" := by native_decide
example : isArticleSubLabel "第五十二条の七" = true := by native_decide
example : isArticleSubLabel "第五十二条の七" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第五十二条の七" := by native_decide
example : isArticleSubLabel "第五十二条の九" = true := by native_decide
example : isArticleSubLabel "第五十二条の九" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第五十二条の九" := by native_decide
example : isArticleSubLabel "第五十二条の五" = true := by native_decide
example : isArticleSubLabel "第五十二条の五" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第五十二条の五" := by native_decide
example : isArticleSubLabel "第五十二条の八" = true := by native_decide
example : isArticleSubLabel "第五十二条の八" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第五十二条の八" := by native_decide
example : isArticleSubLabel "第五十二条の六" = true := by native_decide
example : isArticleSubLabel "第五十二条の六" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第五十二条の六" := by native_decide
example : isArticleSubLabel "第五十二条の十" = true := by native_decide
example : isArticleSubLabel "第五十二条の十" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第五十二条の十" := by native_decide
example : isArticleSubLabel "第五十二条の十一" = true := by native_decide
example : isArticleSubLabel "第五十二条の十一" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第五十二条の十一" := by native_decide
example : isArticleSubLabel "第五十二条の十七" = true := by native_decide
example : isArticleSubLabel "第五十二条の十七" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第五十二条の十七" := by native_decide
example : isArticleSubLabel "第五十二条の十三" = true := by native_decide
example : isArticleSubLabel "第五十二条の十三" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第五十二条の十三" := by native_decide
example : isArticleSubLabel "第五十二条の十九" = true := by native_decide
example : isArticleSubLabel "第五十二条の十九" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第五十二条の十九" := by native_decide
example : isArticleSubLabel "第五十二条の十二" = true := by native_decide
example : isArticleSubLabel "第五十二条の十二" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第五十二条の十二" := by native_decide
example : isArticleSubLabel "第五十二条の十五" = true := by native_decide
example : isArticleSubLabel "第五十二条の十五" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第五十二条の十五" := by native_decide
example : isArticleSubLabel "第五十二条の十八" = true := by native_decide
example : isArticleSubLabel "第五十二条の十八" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第五十二条の十八" := by native_decide
example : isArticleSubLabel "第五十二条の十六" = true := by native_decide
example : isArticleSubLabel "第五十二条の十六" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第五十二条の十六" := by native_decide
example : isArticleSubLabel "第五十二条の十四" = true := by native_decide
example : isArticleSubLabel "第五十二条の十四" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第五十二条の十四" := by native_decide
example : isArticleSubLabel "第五十二条の四" = true := by native_decide
example : isArticleSubLabel "第五十二条の四" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第五十二条の四" := by native_decide
example : isArticleSubLabel "第五十五条の七" = true := by native_decide
example : isArticleSubLabel "第五十五条の七" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第五十五条の七" := by native_decide
example : isArticleSubLabel "第五十五条の九" = true := by native_decide
example : isArticleSubLabel "第五十五条の九" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第五十五条の九" := by native_decide
example : isArticleSubLabel "第五十五条の五" = true := by native_decide
example : isArticleSubLabel "第五十五条の五" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第五十五条の五" := by native_decide
example : isArticleSubLabel "第五十五条の八" = true := by native_decide
example : isArticleSubLabel "第五十五条の八" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第五十五条の八" := by native_decide
example : isArticleSubLabel "第五十五条の六" = true := by native_decide
example : isArticleSubLabel "第五十五条の六" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第五十五条の六" := by native_decide
example : isArticleSubLabel "第五十五条の四" = true := by native_decide
example : isArticleSubLabel "第五十五条の四" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第五十五条の四" := by native_decide
example : isArticleSubLabel "第五十六条の七十一" = true := by native_decide
example : isArticleSubLabel "第五十六条の七十一" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第五十六条の七十一" := by native_decide
example : isArticleSubLabel "第五十六条の七十三" = true := by native_decide
example : isArticleSubLabel "第五十六条の七十三" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第五十六条の七十三" := by native_decide
example : isArticleSubLabel "第五十六条の七十九" = true := by native_decide
example : isArticleSubLabel "第五十六条の七十九" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第五十六条の七十九" := by native_decide
example : isArticleSubLabel "第五十六条の七十二" = true := by native_decide
example : isArticleSubLabel "第五十六条の七十二" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第五十六条の七十二" := by native_decide
example : isArticleSubLabel "第五十六条の七十五" = true := by native_decide
example : isArticleSubLabel "第五十六条の七十五" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第五十六条の七十五" := by native_decide
example : isArticleSubLabel "第五十六条の七十四" = true := by native_decide
example : isArticleSubLabel "第五十六条の七十四" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第五十六条の七十四" := by native_decide
example : isArticleSubLabel "第五十六条の九十" = true := by native_decide
example : isArticleSubLabel "第五十六条の九十" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第五十六条の九十" := by native_decide
example : isArticleSubLabel "第五十六条の九十一" = true := by native_decide
example : isArticleSubLabel "第五十六条の九十一" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第五十六条の九十一" := by native_decide
example : isArticleSubLabel "第五十六条の九十三" = true := by native_decide
example : isArticleSubLabel "第五十六条の九十三" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第五十六条の九十三" := by native_decide
example : isArticleSubLabel "第五十六条の九十二" = true := by native_decide
example : isArticleSubLabel "第五十六条の九十二" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第五十六条の九十二" := by native_decide
example : isArticleSubLabel "第五十六条の九十四" = true := by native_decide
example : isArticleSubLabel "第五十六条の九十四" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第五十六条の九十四" := by native_decide
example : isArticleSubLabel "第五十六条の五十" = true := by native_decide
example : isArticleSubLabel "第五十六条の五十" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第五十六条の五十" := by native_decide
example : isArticleSubLabel "第五十六条の五十一" = true := by native_decide
example : isArticleSubLabel "第五十六条の五十一" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第五十六条の五十一" := by native_decide
example : isArticleSubLabel "第五十六条の五十七" = true := by native_decide
example : isArticleSubLabel "第五十六条の五十七" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第五十六条の五十七" := by native_decide
example : isArticleSubLabel "第五十六条の五十三" = true := by native_decide
example : isArticleSubLabel "第五十六条の五十三" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第五十六条の五十三" := by native_decide
example : isArticleSubLabel "第五十六条の五十二" = true := by native_decide
example : isArticleSubLabel "第五十六条の五十二" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第五十六条の五十二" := by native_decide
example : isArticleSubLabel "第五十六条の五十五" = true := by native_decide
example : isArticleSubLabel "第五十六条の五十五" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第五十六条の五十五" := by native_decide
example : isArticleSubLabel "第五十六条の五十六" = true := by native_decide
example : isArticleSubLabel "第五十六条の五十六" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第五十六条の五十六" := by native_decide
example : isArticleSubLabel "第五十六条の五十四" = true := by native_decide
example : isArticleSubLabel "第五十六条の五十四" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第五十六条の五十四" := by native_decide
example : isArticleSubLabel "第五十六条の八十" = true := by native_decide
example : isArticleSubLabel "第五十六条の八十" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第五十六条の八十" := by native_decide
example : isArticleSubLabel "第五十六条の八十一" = true := by native_decide
example : isArticleSubLabel "第五十六条の八十一" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第五十六条の八十一" := by native_decide
example : isArticleSubLabel "第五十六条の八十七" = true := by native_decide
example : isArticleSubLabel "第五十六条の八十七" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第五十六条の八十七" := by native_decide
example : isArticleSubLabel "第五十六条の八十三" = true := by native_decide
example : isArticleSubLabel "第五十六条の八十三" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第五十六条の八十三" := by native_decide
example : isArticleSubLabel "第五十六条の八十九" = true := by native_decide
example : isArticleSubLabel "第五十六条の八十九" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第五十六条の八十九" := by native_decide
example : isArticleSubLabel "第五十六条の八十二" = true := by native_decide
example : isArticleSubLabel "第五十六条の八十二" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第五十六条の八十二" := by native_decide
example : isArticleSubLabel "第五十六条の八十五" = true := by native_decide
example : isArticleSubLabel "第五十六条の八十五" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第五十六条の八十五" := by native_decide
example : isArticleSubLabel "第五十六条の八十八" = true := by native_decide
example : isArticleSubLabel "第五十六条の八十八" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第五十六条の八十八" := by native_decide
example : isArticleSubLabel "第五十六条の八十六" = true := by native_decide
example : isArticleSubLabel "第五十六条の八十六" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第五十六条の八十六" := by native_decide
example : isArticleSubLabel "第五十六条の八十四" = true := by native_decide
example : isArticleSubLabel "第五十六条の八十四" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第五十六条の八十四" := by native_decide
example : isArticleSubLabel "第五十六条の六十" = true := by native_decide
example : isArticleSubLabel "第五十六条の六十" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第五十六条の六十" := by native_decide
example : isArticleSubLabel "第五十六条の六十一" = true := by native_decide
example : isArticleSubLabel "第五十六条の六十一" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第五十六条の六十一" := by native_decide
example : isArticleSubLabel "第五十六条の六十七" = true := by native_decide
example : isArticleSubLabel "第五十六条の六十七" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第五十六条の六十七" := by native_decide
example : isArticleSubLabel "第五十六条の六十三" = true := by native_decide
example : isArticleSubLabel "第五十六条の六十三" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第五十六条の六十三" := by native_decide
example : isArticleSubLabel "第五十六条の六十二" = true := by native_decide
example : isArticleSubLabel "第五十六条の六十二" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第五十六条の六十二" := by native_decide
example : isArticleSubLabel "第五十六条の六十五" = true := by native_decide
example : isArticleSubLabel "第五十六条の六十五" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第五十六条の六十五" := by native_decide
example : isArticleSubLabel "第五十六条の六十八" = true := by native_decide
example : isArticleSubLabel "第五十六条の六十八" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第五十六条の六十八" := by native_decide
example : isArticleSubLabel "第五十六条の六十六" = true := by native_decide
example : isArticleSubLabel "第五十六条の六十六" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第五十六条の六十六" := by native_decide
example : isArticleSubLabel "第五十六条の六十四" = true := by native_decide
example : isArticleSubLabel "第五十六条の六十四" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第五十六条の六十四" := by native_decide
example : isArticleSubLabel "第五十六条の十一" = true := by native_decide
example : isArticleSubLabel "第五十六条の十一" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第五十六条の十一" := by native_decide
example : isArticleSubLabel "第五十六条の十七" = true := by native_decide
example : isArticleSubLabel "第五十六条の十七" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第五十六条の十七" := by native_decide
example : isArticleSubLabel "第五十六条の十三" = true := by native_decide
example : isArticleSubLabel "第五十六条の十三" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第五十六条の十三" := by native_decide
example : isArticleSubLabel "第五十六条の十二" = true := by native_decide
example : isArticleSubLabel "第五十六条の十二" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第五十六条の十二" := by native_decide
example : isArticleSubLabel "第五十六条の十五" = true := by native_decide
example : isArticleSubLabel "第五十六条の十五" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第五十六条の十五" := by native_decide
example : isArticleSubLabel "第五十六条の十六" = true := by native_decide
example : isArticleSubLabel "第五十六条の十六" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第五十六条の十六" := by native_decide
example : isArticleSubLabel "第五十六条の十四" = true := by native_decide
example : isArticleSubLabel "第五十六条の十四" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第五十六条の十四" := by native_decide
example : isArticleSubLabel "第五十六条の四" = true := by native_decide
example : isArticleSubLabel "第五十六条の四" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第五十六条の四" := by native_decide
example : isArticleSubLabel "第五十六条の四十" = true := by native_decide
example : isArticleSubLabel "第五十六条の四十" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第五十六条の四十" := by native_decide
example : isArticleSubLabel "第五十六条の四十一" = true := by native_decide
example : isArticleSubLabel "第五十六条の四十一" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第五十六条の四十一" := by native_decide
example : isArticleSubLabel "第五十六条の四十三" = true := by native_decide
example : isArticleSubLabel "第五十六条の四十三" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第五十六条の四十三" := by native_decide
example : isArticleSubLabel "第五十六条の四十九" = true := by native_decide
example : isArticleSubLabel "第五十六条の四十九" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第五十六条の四十九" := by native_decide
example : isArticleSubLabel "第五十六条の四十二" = true := by native_decide
example : isArticleSubLabel "第五十六条の四十二" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第五十六条の四十二" := by native_decide
example : isArticleSubLabel "第五十六条の四十六" = true := by native_decide
example : isArticleSubLabel "第五十六条の四十六" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第五十六条の四十六" := by native_decide
example : isArticleSubLabel "第五十四条の七" = true := by native_decide
example : isArticleSubLabel "第五十四条の七" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第五十四条の七" := by native_decide
example : isArticleSubLabel "第五十四条の九" = true := by native_decide
example : isArticleSubLabel "第五十四条の九" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第五十四条の九" := by native_decide
example : isArticleSubLabel "第五十四条の五" = true := by native_decide
example : isArticleSubLabel "第五十四条の五" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第五十四条の五" := by native_decide
example : isArticleSubLabel "第五十四条の五十" = true := by native_decide
example : isArticleSubLabel "第五十四条の五十" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第五十四条の五十" := by native_decide
example : isArticleSubLabel "第五十四条の五十一" = true := by native_decide
example : isArticleSubLabel "第五十四条の五十一" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第五十四条の五十一" := by native_decide
example : isArticleSubLabel "第五十四条の五十七" = true := by native_decide
example : isArticleSubLabel "第五十四条の五十七" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第五十四条の五十七" := by native_decide
example : isArticleSubLabel "第五十四条の五十三" = true := by native_decide
example : isArticleSubLabel "第五十四条の五十三" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第五十四条の五十三" := by native_decide
example : isArticleSubLabel "第五十四条の五十九" = true := by native_decide
example : isArticleSubLabel "第五十四条の五十九" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第五十四条の五十九" := by native_decide
example : isArticleSubLabel "第五十四条の五十二" = true := by native_decide
example : isArticleSubLabel "第五十四条の五十二" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第五十四条の五十二" := by native_decide
example : isArticleSubLabel "第五十四条の五十五" = true := by native_decide
example : isArticleSubLabel "第五十四条の五十五" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第五十四条の五十五" := by native_decide
example : isArticleSubLabel "第五十四条の五十八" = true := by native_decide
example : isArticleSubLabel "第五十四条の五十八" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第五十四条の五十八" := by native_decide
example : isArticleSubLabel "第五十四条の五十六" = true := by native_decide
example : isArticleSubLabel "第五十四条の五十六" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第五十四条の五十六" := by native_decide
example : isArticleSubLabel "第五十四条の五十四" = true := by native_decide
example : isArticleSubLabel "第五十四条の五十四" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第五十四条の五十四" := by native_decide
example : isArticleSubLabel "第五十四条の八" = true := by native_decide
example : isArticleSubLabel "第五十四条の八" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第五十四条の八" := by native_decide
example : isArticleSubLabel "第五十四条の六" = true := by native_decide
example : isArticleSubLabel "第五十四条の六" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第五十四条の六" := by native_decide
example : isArticleSubLabel "第五十四条の六十" = true := by native_decide
example : isArticleSubLabel "第五十四条の六十" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第五十四条の六十" := by native_decide
example : isArticleSubLabel "第五十四条の六十一" = true := by native_decide
example : isArticleSubLabel "第五十四条の六十一" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第五十四条の六十一" := by native_decide
example : isArticleSubLabel "第五十四条の十" = true := by native_decide
example : isArticleSubLabel "第五十四条の十" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第五十四条の十" := by native_decide
example : isArticleSubLabel "第五十四条の十一" = true := by native_decide
example : isArticleSubLabel "第五十四条の十一" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第五十四条の十一" := by native_decide
example : isArticleSubLabel "第五十四条の十七" = true := by native_decide
example : isArticleSubLabel "第五十四条の十七" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第五十四条の十七" := by native_decide
example : isArticleSubLabel "第五十四条の十三" = true := by native_decide
example : isArticleSubLabel "第五十四条の十三" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第五十四条の十三" := by native_decide
example : isArticleSubLabel "第五十四条の十九" = true := by native_decide
example : isArticleSubLabel "第五十四条の十九" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第五十四条の十九" := by native_decide
example : isArticleSubLabel "第五十四条の十二" = true := by native_decide
example : isArticleSubLabel "第五十四条の十二" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第五十四条の十二" := by native_decide
example : isArticleSubLabel "第五十四条の十五" = true := by native_decide
example : isArticleSubLabel "第五十四条の十五" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第五十四条の十五" := by native_decide
example : isArticleSubLabel "第五十四条の十八" = true := by native_decide
example : isArticleSubLabel "第五十四条の十八" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第五十四条の十八" := by native_decide
example : isArticleSubLabel "第五十四条の十六" = true := by native_decide
example : isArticleSubLabel "第五十四条の十六" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第五十四条の十六" := by native_decide
example : isArticleSubLabel "第五十四条の十四" = true := by native_decide
example : isArticleSubLabel "第五十四条の十四" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第五十四条の十四" := by native_decide
example : isArticleSubLabel "第五十四条の四" = true := by native_decide
example : isArticleSubLabel "第五十四条の四" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第五十四条の四" := by native_decide
example : isArticleSubLabel "第五十四条の四十" = true := by native_decide
example : isArticleSubLabel "第五十四条の四十" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第五十四条の四十" := by native_decide
example : isArticleSubLabel "第五十四条の四十一" = true := by native_decide
example : isArticleSubLabel "第五十四条の四十一" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第五十四条の四十一" := by native_decide
example : isArticleSubLabel "第五十四条の四十七" = true := by native_decide
example : isArticleSubLabel "第五十四条の四十七" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第五十四条の四十七" := by native_decide
example : isArticleSubLabel "第五十四条の四十三" = true := by native_decide
example : isArticleSubLabel "第五十四条の四十三" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第五十四条の四十三" := by native_decide
example : isArticleSubLabel "第五十四条の四十九" = true := by native_decide
example : isArticleSubLabel "第五十四条の四十九" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第五十四条の四十九" := by native_decide
example : isArticleSubLabel "第五十四条の四十二" = true := by native_decide
example : isArticleSubLabel "第五十四条の四十二" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第五十四条の四十二" := by native_decide
example : isArticleSubLabel "第五十四条の四十五" = true := by native_decide
example : isArticleSubLabel "第五十四条の四十五" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第五十四条の四十五" := by native_decide
example : isArticleSubLabel "第五十四条の四十八" = true := by native_decide
example : isArticleSubLabel "第五十四条の四十八" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第五十四条の四十八" := by native_decide
example : isArticleSubLabel "第五十四条の四十六" = true := by native_decide
example : isArticleSubLabel "第五十四条の四十六" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第五十四条の四十六" := by native_decide
example : isArticleSubLabel "第五十四条の四十四" = true := by native_decide
example : isArticleSubLabel "第五十四条の四十四" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第五十四条の四十四" := by native_decide
example : isArticleSubLabel "第五十条の七" = true := by native_decide
example : isArticleSubLabel "第五十条の七" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第五十条の七" := by native_decide
example : isArticleSubLabel "第五十条の九" = true := by native_decide
example : isArticleSubLabel "第五十条の九" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第五十条の九" := by native_decide
example : isArticleSubLabel "第五十条の五" = true := by native_decide
example : isArticleSubLabel "第五十条の五" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第五十条の五" := by native_decide
example : isArticleSubLabel "第五十条の八" = true := by native_decide
example : isArticleSubLabel "第五十条の八" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第五十条の八" := by native_decide
example : isArticleSubLabel "第五十条の六" = true := by native_decide
example : isArticleSubLabel "第五十条の六" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第五十条の六" := by native_decide
example : isArticleSubLabel "第五十条の十" = true := by native_decide
example : isArticleSubLabel "第五十条の十" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第五十条の十" := by native_decide
example : isArticleSubLabel "第五十条の四" = true := by native_decide
example : isArticleSubLabel "第五十条の四" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第五十条の四" := by native_decide
example : isArticleSubLabel "第五条の七" = true := by native_decide
example : isArticleSubLabel "第五条の七" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第五条の七" := by native_decide
example : isArticleSubLabel "第五条の九" = true := by native_decide
example : isArticleSubLabel "第五条の九" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第五条の九" := by native_decide
example : isArticleSubLabel "第五条の五" = true := by native_decide
example : isArticleSubLabel "第五条の五" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第五条の五" := by native_decide
example : isArticleSubLabel "第五条の八" = true := by native_decide
example : isArticleSubLabel "第五条の八" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第五条の八" := by native_decide
example : isArticleSubLabel "第五条の六" = true := by native_decide
example : isArticleSubLabel "第五条の六" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第五条の六" := by native_decide
example : isArticleSubLabel "第五条の十" = true := by native_decide
example : isArticleSubLabel "第五条の十" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第五条の十" := by native_decide
example : isArticleSubLabel "第五条の十一" = true := by native_decide
example : isArticleSubLabel "第五条の十一" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第五条の十一" := by native_decide
example : isArticleSubLabel "第五条の十三" = true := by native_decide
example : isArticleSubLabel "第五条の十三" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第五条の十三" := by native_decide
example : isArticleSubLabel "第五条の十二" = true := by native_decide
example : isArticleSubLabel "第五条の十二" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第五条の十二" := by native_decide
example : isArticleSubLabel "第五条の十五" = true := by native_decide
example : isArticleSubLabel "第五条の十五" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第五条の十五" := by native_decide
example : isArticleSubLabel "第五条の十四" = true := by native_decide
example : isArticleSubLabel "第五条の十四" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第五条の十四" := by native_decide
example : isArticleSubLabel "第五条の四" = true := by native_decide
example : isArticleSubLabel "第五条の四" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第五条の四" := by native_decide
example : isArticleSubLabel "第八十一条の七" = true := by native_decide
example : isArticleSubLabel "第八十一条の七" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第八十一条の七" := by native_decide
example : isArticleSubLabel "第八十一条の九" = true := by native_decide
example : isArticleSubLabel "第八十一条の九" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第八十一条の九" := by native_decide
example : isArticleSubLabel "第八十一条の五" = true := by native_decide
example : isArticleSubLabel "第八十一条の五" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第八十一条の五" := by native_decide
example : isArticleSubLabel "第八十一条の八" = true := by native_decide
example : isArticleSubLabel "第八十一条の八" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第八十一条の八" := by native_decide
example : isArticleSubLabel "第八十一条の六" = true := by native_decide
example : isArticleSubLabel "第八十一条の六" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第八十一条の六" := by native_decide
example : isArticleSubLabel "第八十一条の十" = true := by native_decide
example : isArticleSubLabel "第八十一条の十" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第八十一条の十" := by native_decide
example : isArticleSubLabel "第八十一条の十一" = true := by native_decide
example : isArticleSubLabel "第八十一条の十一" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第八十一条の十一" := by native_decide
example : isArticleSubLabel "第八十一条の十七" = true := by native_decide
example : isArticleSubLabel "第八十一条の十七" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第八十一条の十七" := by native_decide
example : isArticleSubLabel "第八十一条の十九" = true := by native_decide
example : isArticleSubLabel "第八十一条の十九" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第八十一条の十九" := by native_decide
example : isArticleSubLabel "第八十一条の十二" = true := by native_decide
example : isArticleSubLabel "第八十一条の十二" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第八十一条の十二" := by native_decide
example : isArticleSubLabel "第八十一条の十八" = true := by native_decide
example : isArticleSubLabel "第八十一条の十八" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第八十一条の十八" := by native_decide
example : isArticleSubLabel "第八十一条の四" = true := by native_decide
example : isArticleSubLabel "第八十一条の四" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第八十一条の四" := by native_decide
example : isArticleSubLabel "第八十一条の四十" = true := by native_decide
example : isArticleSubLabel "第八十一条の四十" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第八十一条の四十" := by native_decide
example : isArticleSubLabel "第八十七条の七" = true := by native_decide
example : isArticleSubLabel "第八十七条の七" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第八十七条の七" := by native_decide
example : isArticleSubLabel "第八十七条の五" = true := by native_decide
example : isArticleSubLabel "第八十七条の五" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第八十七条の五" := by native_decide
example : isArticleSubLabel "第八十七条の八" = true := by native_decide
example : isArticleSubLabel "第八十七条の八" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第八十七条の八" := by native_decide
example : isArticleSubLabel "第八十七条の六" = true := by native_decide
example : isArticleSubLabel "第八十七条の六" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第八十七条の六" := by native_decide
example : isArticleSubLabel "第八十七条の四" = true := by native_decide
example : isArticleSubLabel "第八十七条の四" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第八十七条の四" := by native_decide
example : isArticleSubLabel "第八十三条の五" = true := by native_decide
example : isArticleSubLabel "第八十三条の五" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第八十三条の五" := by native_decide
example : isArticleSubLabel "第八十三条の四" = true := by native_decide
example : isArticleSubLabel "第八十三条の四" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第八十三条の四" := by native_decide
example : isArticleSubLabel "第八十九条の五" = true := by native_decide
example : isArticleSubLabel "第八十九条の五" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第八十九条の五" := by native_decide
example : isArticleSubLabel "第八十九条の四" = true := by native_decide
example : isArticleSubLabel "第八十九条の四" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第八十九条の四" := by native_decide
example : isArticleSubLabel "第八十二条の七" = true := by native_decide
example : isArticleSubLabel "第八十二条の七" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第八十二条の七" := by native_decide
example : isArticleSubLabel "第八十二条の九" = true := by native_decide
example : isArticleSubLabel "第八十二条の九" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第八十二条の九" := by native_decide
example : isArticleSubLabel "第八十二条の五" = true := by native_decide
example : isArticleSubLabel "第八十二条の五" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第八十二条の五" := by native_decide
example : isArticleSubLabel "第八十二条の八" = true := by native_decide
example : isArticleSubLabel "第八十二条の八" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第八十二条の八" := by native_decide
example : isArticleSubLabel "第八十二条の六" = true := by native_decide
example : isArticleSubLabel "第八十二条の六" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第八十二条の六" := by native_decide
example : isArticleSubLabel "第八十二条の十" = true := by native_decide
example : isArticleSubLabel "第八十二条の十" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第八十二条の十" := by native_decide
example : isArticleSubLabel "第八十二条の十一" = true := by native_decide
example : isArticleSubLabel "第八十二条の十一" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第八十二条の十一" := by native_decide
example : isArticleSubLabel "第八十二条の十七" = true := by native_decide
example : isArticleSubLabel "第八十二条の十七" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第八十二条の十七" := by native_decide
example : isArticleSubLabel "第八十二条の十三" = true := by native_decide
example : isArticleSubLabel "第八十二条の十三" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第八十二条の十三" := by native_decide
example : isArticleSubLabel "第八十二条の十九" = true := by native_decide
example : isArticleSubLabel "第八十二条の十九" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第八十二条の十九" := by native_decide
example : isArticleSubLabel "第八十二条の十二" = true := by native_decide
example : isArticleSubLabel "第八十二条の十二" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第八十二条の十二" := by native_decide
example : isArticleSubLabel "第八十二条の十五" = true := by native_decide
example : isArticleSubLabel "第八十二条の十五" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第八十二条の十五" := by native_decide
example : isArticleSubLabel "第八十二条の十八" = true := by native_decide
example : isArticleSubLabel "第八十二条の十八" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第八十二条の十八" := by native_decide
example : isArticleSubLabel "第八十二条の十六" = true := by native_decide
example : isArticleSubLabel "第八十二条の十六" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第八十二条の十六" := by native_decide
example : isArticleSubLabel "第八十二条の十四" = true := by native_decide
example : isArticleSubLabel "第八十二条の十四" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第八十二条の十四" := by native_decide
example : isArticleSubLabel "第八十二条の四" = true := by native_decide
example : isArticleSubLabel "第八十二条の四" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第八十二条の四" := by native_decide
example : isArticleSubLabel "第八十八条の七" = true := by native_decide
example : isArticleSubLabel "第八十八条の七" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第八十八条の七" := by native_decide
example : isArticleSubLabel "第八十八条の五" = true := by native_decide
example : isArticleSubLabel "第八十八条の五" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第八十八条の五" := by native_decide
example : isArticleSubLabel "第八十八条の六" = true := by native_decide
example : isArticleSubLabel "第八十八条の六" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第八十八条の六" := by native_decide
example : isArticleSubLabel "第八十八条の四" = true := by native_decide
example : isArticleSubLabel "第八十八条の四" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第八十八条の四" := by native_decide
example : isArticleSubLabel "第八十六条の七" = true := by native_decide
example : isArticleSubLabel "第八十六条の七" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第八十六条の七" := by native_decide
example : isArticleSubLabel "第八十六条の九" = true := by native_decide
example : isArticleSubLabel "第八十六条の九" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第八十六条の九" := by native_decide
example : isArticleSubLabel "第八十六条の五" = true := by native_decide
example : isArticleSubLabel "第八十六条の五" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第八十六条の五" := by native_decide
example : isArticleSubLabel "第八十六条の八" = true := by native_decide
example : isArticleSubLabel "第八十六条の八" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第八十六条の八" := by native_decide
example : isArticleSubLabel "第八十六条の六" = true := by native_decide
example : isArticleSubLabel "第八十六条の六" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第八十六条の六" := by native_decide
example : isArticleSubLabel "第八十六条の四" = true := by native_decide
example : isArticleSubLabel "第八十六条の四" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第八十六条の四" := by native_decide
example : isArticleSubLabel "第八十四条の七" = true := by native_decide
example : isArticleSubLabel "第八十四条の七" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第八十四条の七" := by native_decide
example : isArticleSubLabel "第八十四条の五" = true := by native_decide
example : isArticleSubLabel "第八十四条の五" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第八十四条の五" := by native_decide
example : isArticleSubLabel "第八十四条の六" = true := by native_decide
example : isArticleSubLabel "第八十四条の六" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第八十四条の六" := by native_decide
example : isArticleSubLabel "第八十四条の四" = true := by native_decide
example : isArticleSubLabel "第八十四条の四" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第八十四条の四" := by native_decide
example : isArticleSubLabel "第八条の七" = true := by native_decide
example : isArticleSubLabel "第八条の七" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第八条の七" := by native_decide
example : isArticleSubLabel "第八条の九" = true := by native_decide
example : isArticleSubLabel "第八条の九" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第八条の九" := by native_decide
example : isArticleSubLabel "第八条の五" = true := by native_decide
example : isArticleSubLabel "第八条の五" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第八条の五" := by native_decide
example : isArticleSubLabel "第八条の五十" = true := by native_decide
example : isArticleSubLabel "第八条の五十" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第八条の五十" := by native_decide
example : isArticleSubLabel "第八条の五十一" = true := by native_decide
example : isArticleSubLabel "第八条の五十一" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第八条の五十一" := by native_decide
example : isArticleSubLabel "第八条の五十七" = true := by native_decide
example : isArticleSubLabel "第八条の五十七" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第八条の五十七" := by native_decide
example : isArticleSubLabel "第八条の五十三" = true := by native_decide
example : isArticleSubLabel "第八条の五十三" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第八条の五十三" := by native_decide
example : isArticleSubLabel "第八条の五十九" = true := by native_decide
example : isArticleSubLabel "第八条の五十九" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第八条の五十九" := by native_decide
example : isArticleSubLabel "第八条の五十二" = true := by native_decide
example : isArticleSubLabel "第八条の五十二" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第八条の五十二" := by native_decide
example : isArticleSubLabel "第八条の五十五" = true := by native_decide
example : isArticleSubLabel "第八条の五十五" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第八条の五十五" := by native_decide
example : isArticleSubLabel "第八条の五十八" = true := by native_decide
example : isArticleSubLabel "第八条の五十八" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第八条の五十八" := by native_decide
example : isArticleSubLabel "第八条の五十六" = true := by native_decide
example : isArticleSubLabel "第八条の五十六" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第八条の五十六" := by native_decide
example : isArticleSubLabel "第八条の五十四" = true := by native_decide
example : isArticleSubLabel "第八条の五十四" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第八条の五十四" := by native_decide
example : isArticleSubLabel "第八条の八" = true := by native_decide
example : isArticleSubLabel "第八条の八" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第八条の八" := by native_decide
example : isArticleSubLabel "第八条の六" = true := by native_decide
example : isArticleSubLabel "第八条の六" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第八条の六" := by native_decide
example : isArticleSubLabel "第八条の六十" = true := by native_decide
example : isArticleSubLabel "第八条の六十" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第八条の六十" := by native_decide
example : isArticleSubLabel "第八条の十" = true := by native_decide
example : isArticleSubLabel "第八条の十" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第八条の十" := by native_decide
example : isArticleSubLabel "第八条の十一" = true := by native_decide
example : isArticleSubLabel "第八条の十一" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第八条の十一" := by native_decide
example : isArticleSubLabel "第八条の十七" = true := by native_decide
example : isArticleSubLabel "第八条の十七" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第八条の十七" := by native_decide
example : isArticleSubLabel "第八条の十三" = true := by native_decide
example : isArticleSubLabel "第八条の十三" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第八条の十三" := by native_decide
example : isArticleSubLabel "第八条の十九" = true := by native_decide
example : isArticleSubLabel "第八条の十九" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第八条の十九" := by native_decide
example : isArticleSubLabel "第八条の十二" = true := by native_decide
example : isArticleSubLabel "第八条の十二" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第八条の十二" := by native_decide
example : isArticleSubLabel "第八条の十五" = true := by native_decide
example : isArticleSubLabel "第八条の十五" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第八条の十五" := by native_decide
example : isArticleSubLabel "第八条の十八" = true := by native_decide
example : isArticleSubLabel "第八条の十八" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第八条の十八" := by native_decide
example : isArticleSubLabel "第八条の十六" = true := by native_decide
example : isArticleSubLabel "第八条の十六" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第八条の十六" := by native_decide
example : isArticleSubLabel "第八条の十四" = true := by native_decide
example : isArticleSubLabel "第八条の十四" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第八条の十四" := by native_decide
example : isArticleSubLabel "第八条の四" = true := by native_decide
example : isArticleSubLabel "第八条の四" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第八条の四" := by native_decide
example : isArticleSubLabel "第八条の四十" = true := by native_decide
example : isArticleSubLabel "第八条の四十" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第八条の四十" := by native_decide
example : isArticleSubLabel "第八条の四十一" = true := by native_decide
example : isArticleSubLabel "第八条の四十一" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第八条の四十一" := by native_decide
example : isArticleSubLabel "第八条の四十七" = true := by native_decide
example : isArticleSubLabel "第八条の四十七" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第八条の四十七" := by native_decide
example : isArticleSubLabel "第八条の四十三" = true := by native_decide
example : isArticleSubLabel "第八条の四十三" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第八条の四十三" := by native_decide
example : isArticleSubLabel "第八条の四十九" = true := by native_decide
example : isArticleSubLabel "第八条の四十九" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第八条の四十九" := by native_decide
example : isArticleSubLabel "第八条の四十二" = true := by native_decide
example : isArticleSubLabel "第八条の四十二" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第八条の四十二" := by native_decide
example : isArticleSubLabel "第八条の四十五" = true := by native_decide
example : isArticleSubLabel "第八条の四十五" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第八条の四十五" := by native_decide
example : isArticleSubLabel "第八条の四十八" = true := by native_decide
example : isArticleSubLabel "第八条の四十八" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第八条の四十八" := by native_decide
example : isArticleSubLabel "第八条の四十六" = true := by native_decide
example : isArticleSubLabel "第八条の四十六" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第八条の四十六" := by native_decide
example : isArticleSubLabel "第八条の四十四" = true := by native_decide
example : isArticleSubLabel "第八条の四十四" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第八条の四十四" := by native_decide
example : isArticleSubLabel "第六十一条の七" = true := by native_decide
example : isArticleSubLabel "第六十一条の七" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第六十一条の七" := by native_decide
example : isArticleSubLabel "第六十一条の九" = true := by native_decide
example : isArticleSubLabel "第六十一条の九" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第六十一条の九" := by native_decide
example : isArticleSubLabel "第六十一条の五" = true := by native_decide
example : isArticleSubLabel "第六十一条の五" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第六十一条の五" := by native_decide
example : isArticleSubLabel "第六十一条の八" = true := by native_decide
example : isArticleSubLabel "第六十一条の八" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第六十一条の八" := by native_decide
example : isArticleSubLabel "第六十一条の六" = true := by native_decide
example : isArticleSubLabel "第六十一条の六" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第六十一条の六" := by native_decide
example : isArticleSubLabel "第六十一条の十" = true := by native_decide
example : isArticleSubLabel "第六十一条の十" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第六十一条の十" := by native_decide
example : isArticleSubLabel "第六十一条の十一" = true := by native_decide
example : isArticleSubLabel "第六十一条の十一" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第六十一条の十一" := by native_decide
example : isArticleSubLabel "第六十一条の十三" = true := by native_decide
example : isArticleSubLabel "第六十一条の十三" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第六十一条の十三" := by native_decide
example : isArticleSubLabel "第六十一条の十二" = true := by native_decide
example : isArticleSubLabel "第六十一条の十二" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第六十一条の十二" := by native_decide
example : isArticleSubLabel "第六十一条の四" = true := by native_decide
example : isArticleSubLabel "第六十一条の四" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第六十一条の四" := by native_decide
example : isArticleSubLabel "第六十七条の七" = true := by native_decide
example : isArticleSubLabel "第六十七条の七" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第六十七条の七" := by native_decide
example : isArticleSubLabel "第六十七条の九" = true := by native_decide
example : isArticleSubLabel "第六十七条の九" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第六十七条の九" := by native_decide
example : isArticleSubLabel "第六十七条の五" = true := by native_decide
example : isArticleSubLabel "第六十七条の五" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第六十七条の五" := by native_decide
example : isArticleSubLabel "第六十七条の八" = true := by native_decide
example : isArticleSubLabel "第六十七条の八" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第六十七条の八" := by native_decide
example : isArticleSubLabel "第六十七条の六" = true := by native_decide
example : isArticleSubLabel "第六十七条の六" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第六十七条の六" := by native_decide
example : isArticleSubLabel "第六十七条の十" = true := by native_decide
example : isArticleSubLabel "第六十七条の十" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第六十七条の十" := by native_decide
example : isArticleSubLabel "第六十七条の十一" = true := by native_decide
example : isArticleSubLabel "第六十七条の十一" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第六十七条の十一" := by native_decide
example : isArticleSubLabel "第六十七条の十七" = true := by native_decide
example : isArticleSubLabel "第六十七条の十七" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第六十七条の十七" := by native_decide
example : isArticleSubLabel "第六十七条の十三" = true := by native_decide
example : isArticleSubLabel "第六十七条の十三" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第六十七条の十三" := by native_decide
example : isArticleSubLabel "第六十七条の十九" = true := by native_decide
example : isArticleSubLabel "第六十七条の十九" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第六十七条の十九" := by native_decide
example : isArticleSubLabel "第六十七条の十二" = true := by native_decide
example : isArticleSubLabel "第六十七条の十二" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第六十七条の十二" := by native_decide
example : isArticleSubLabel "第六十七条の十五" = true := by native_decide
example : isArticleSubLabel "第六十七条の十五" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第六十七条の十五" := by native_decide
example : isArticleSubLabel "第六十七条の十八" = true := by native_decide
example : isArticleSubLabel "第六十七条の十八" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第六十七条の十八" := by native_decide
example : isArticleSubLabel "第六十七条の十六" = true := by native_decide
example : isArticleSubLabel "第六十七条の十六" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第六十七条の十六" := by native_decide
example : isArticleSubLabel "第六十七条の十四" = true := by native_decide
example : isArticleSubLabel "第六十七条の十四" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第六十七条の十四" := by native_decide
example : isArticleSubLabel "第六十七条の四" = true := by native_decide
example : isArticleSubLabel "第六十七条の四" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第六十七条の四" := by native_decide
example : isArticleSubLabel "第六十三条の七" = true := by native_decide
example : isArticleSubLabel "第六十三条の七" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第六十三条の七" := by native_decide
example : isArticleSubLabel "第六十三条の九" = true := by native_decide
example : isArticleSubLabel "第六十三条の九" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第六十三条の九" := by native_decide
example : isArticleSubLabel "第六十三条の五" = true := by native_decide
example : isArticleSubLabel "第六十三条の五" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第六十三条の五" := by native_decide
example : isArticleSubLabel "第六十三条の八" = true := by native_decide
example : isArticleSubLabel "第六十三条の八" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第六十三条の八" := by native_decide
example : isArticleSubLabel "第六十三条の六" = true := by native_decide
example : isArticleSubLabel "第六十三条の六" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第六十三条の六" := by native_decide
example : isArticleSubLabel "第六十三条の四" = true := by native_decide
example : isArticleSubLabel "第六十三条の四" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第六十三条の四" := by native_decide
example : isArticleSubLabel "第六十九条の七" = true := by native_decide
example : isArticleSubLabel "第六十九条の七" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第六十九条の七" := by native_decide
example : isArticleSubLabel "第六十九条の九" = true := by native_decide
example : isArticleSubLabel "第六十九条の九" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第六十九条の九" := by native_decide
example : isArticleSubLabel "第六十九条の五" = true := by native_decide
example : isArticleSubLabel "第六十九条の五" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第六十九条の五" := by native_decide
example : isArticleSubLabel "第六十九条の八" = true := by native_decide
example : isArticleSubLabel "第六十九条の八" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第六十九条の八" := by native_decide
example : isArticleSubLabel "第六十九条の六" = true := by native_decide
example : isArticleSubLabel "第六十九条の六" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第六十九条の六" := by native_decide
example : isArticleSubLabel "第六十九条の十" = true := by native_decide
example : isArticleSubLabel "第六十九条の十" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第六十九条の十" := by native_decide
example : isArticleSubLabel "第六十九条の十一" = true := by native_decide
example : isArticleSubLabel "第六十九条の十一" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第六十九条の十一" := by native_decide
example : isArticleSubLabel "第六十九条の十七" = true := by native_decide
example : isArticleSubLabel "第六十九条の十七" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第六十九条の十七" := by native_decide
example : isArticleSubLabel "第六十九条の十三" = true := by native_decide
example : isArticleSubLabel "第六十九条の十三" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第六十九条の十三" := by native_decide
example : isArticleSubLabel "第六十九条の十九" = true := by native_decide
example : isArticleSubLabel "第六十九条の十九" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第六十九条の十九" := by native_decide
example : isArticleSubLabel "第六十九条の十二" = true := by native_decide
example : isArticleSubLabel "第六十九条の十二" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第六十九条の十二" := by native_decide
example : isArticleSubLabel "第六十九条の十五" = true := by native_decide
example : isArticleSubLabel "第六十九条の十五" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第六十九条の十五" := by native_decide
example : isArticleSubLabel "第六十九条の十八" = true := by native_decide
example : isArticleSubLabel "第六十九条の十八" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第六十九条の十八" := by native_decide
example : isArticleSubLabel "第六十九条の十六" = true := by native_decide
example : isArticleSubLabel "第六十九条の十六" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第六十九条の十六" := by native_decide
example : isArticleSubLabel "第六十九条の十四" = true := by native_decide
example : isArticleSubLabel "第六十九条の十四" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第六十九条の十四" := by native_decide
example : isArticleSubLabel "第六十九条の四" = true := by native_decide
example : isArticleSubLabel "第六十九条の四" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第六十九条の四" := by native_decide
example : isArticleSubLabel "第六十二条の七" = true := by native_decide
example : isArticleSubLabel "第六十二条の七" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第六十二条の七" := by native_decide
example : isArticleSubLabel "第六十二条の九" = true := by native_decide
example : isArticleSubLabel "第六十二条の九" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第六十二条の九" := by native_decide
example : isArticleSubLabel "第六十二条の五" = true := by native_decide
example : isArticleSubLabel "第六十二条の五" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第六十二条の五" := by native_decide
example : isArticleSubLabel "第六十二条の八" = true := by native_decide
example : isArticleSubLabel "第六十二条の八" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第六十二条の八" := by native_decide
example : isArticleSubLabel "第六十二条の六" = true := by native_decide
example : isArticleSubLabel "第六十二条の六" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第六十二条の六" := by native_decide
example : isArticleSubLabel "第六十二条の十" = true := by native_decide
example : isArticleSubLabel "第六十二条の十" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第六十二条の十" := by native_decide
example : isArticleSubLabel "第六十二条の十一" = true := by native_decide
example : isArticleSubLabel "第六十二条の十一" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第六十二条の十一" := by native_decide
example : isArticleSubLabel "第六十二条の十七" = true := by native_decide
example : isArticleSubLabel "第六十二条の十七" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第六十二条の十七" := by native_decide
example : isArticleSubLabel "第六十二条の十三" = true := by native_decide
example : isArticleSubLabel "第六十二条の十三" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第六十二条の十三" := by native_decide
example : isArticleSubLabel "第六十二条の十九" = true := by native_decide
example : isArticleSubLabel "第六十二条の十九" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第六十二条の十九" := by native_decide
example : isArticleSubLabel "第六十二条の十二" = true := by native_decide
example : isArticleSubLabel "第六十二条の十二" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第六十二条の十二" := by native_decide
example : isArticleSubLabel "第六十二条の十五" = true := by native_decide
example : isArticleSubLabel "第六十二条の十五" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第六十二条の十五" := by native_decide
example : isArticleSubLabel "第六十二条の十八" = true := by native_decide
example : isArticleSubLabel "第六十二条の十八" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第六十二条の十八" := by native_decide
example : isArticleSubLabel "第六十二条の十六" = true := by native_decide
example : isArticleSubLabel "第六十二条の十六" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第六十二条の十六" := by native_decide
example : isArticleSubLabel "第六十二条の十四" = true := by native_decide
example : isArticleSubLabel "第六十二条の十四" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第六十二条の十四" := by native_decide
example : isArticleSubLabel "第六十二条の四" = true := by native_decide
example : isArticleSubLabel "第六十二条の四" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第六十二条の四" := by native_decide
example : isArticleSubLabel "第六十五条の七" = true := by native_decide
example : isArticleSubLabel "第六十五条の七" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第六十五条の七" := by native_decide
example : isArticleSubLabel "第六十五条の九" = true := by native_decide
example : isArticleSubLabel "第六十五条の九" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第六十五条の九" := by native_decide
example : isArticleSubLabel "第六十五条の五" = true := by native_decide
example : isArticleSubLabel "第六十五条の五" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第六十五条の五" := by native_decide
example : isArticleSubLabel "第六十五条の八" = true := by native_decide
example : isArticleSubLabel "第六十五条の八" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第六十五条の八" := by native_decide
example : isArticleSubLabel "第六十五条の六" = true := by native_decide
example : isArticleSubLabel "第六十五条の六" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第六十五条の六" := by native_decide
example : isArticleSubLabel "第六十五条の十" = true := by native_decide
example : isArticleSubLabel "第六十五条の十" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第六十五条の十" := by native_decide
example : isArticleSubLabel "第六十五条の四" = true := by native_decide
example : isArticleSubLabel "第六十五条の四" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第六十五条の四" := by native_decide
example : isArticleSubLabel "第六十八条の五" = true := by native_decide
example : isArticleSubLabel "第六十八条の五" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第六十八条の五" := by native_decide
example : isArticleSubLabel "第六十八条の六" = true := by native_decide
example : isArticleSubLabel "第六十八条の六" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第六十八条の六" := by native_decide
example : isArticleSubLabel "第六十八条の四" = true := by native_decide
example : isArticleSubLabel "第六十八条の四" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第六十八条の四" := by native_decide
example : isArticleSubLabel "第六十六条の七" = true := by native_decide
example : isArticleSubLabel "第六十六条の七" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第六十六条の七" := by native_decide
example : isArticleSubLabel "第六十六条の九" = true := by native_decide
example : isArticleSubLabel "第六十六条の九" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第六十六条の九" := by native_decide
example : isArticleSubLabel "第六十六条の五" = true := by native_decide
example : isArticleSubLabel "第六十六条の五" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第六十六条の五" := by native_decide
example : isArticleSubLabel "第六十六条の八" = true := by native_decide
example : isArticleSubLabel "第六十六条の八" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第六十六条の八" := by native_decide
example : isArticleSubLabel "第六十六条の六" = true := by native_decide
example : isArticleSubLabel "第六十六条の六" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第六十六条の六" := by native_decide
example : isArticleSubLabel "第六十六条の十" = true := by native_decide
example : isArticleSubLabel "第六十六条の十" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第六十六条の十" := by native_decide
example : isArticleSubLabel "第六十六条の十一" = true := by native_decide
example : isArticleSubLabel "第六十六条の十一" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第六十六条の十一" := by native_decide
example : isArticleSubLabel "第六十六条の十三" = true := by native_decide
example : isArticleSubLabel "第六十六条の十三" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第六十六条の十三" := by native_decide
example : isArticleSubLabel "第六十六条の十二" = true := by native_decide
example : isArticleSubLabel "第六十六条の十二" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第六十六条の十二" := by native_decide
example : isArticleSubLabel "第六十六条の四" = true := by native_decide
example : isArticleSubLabel "第六十六条の四" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第六十六条の四" := by native_decide
example : isArticleSubLabel "第六十四条の七" = true := by native_decide
example : isArticleSubLabel "第六十四条の七" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第六十四条の七" := by native_decide
example : isArticleSubLabel "第六十四条の九" = true := by native_decide
example : isArticleSubLabel "第六十四条の九" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第六十四条の九" := by native_decide
example : isArticleSubLabel "第六十四条の五" = true := by native_decide
example : isArticleSubLabel "第六十四条の五" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第六十四条の五" := by native_decide
example : isArticleSubLabel "第六十四条の八" = true := by native_decide
example : isArticleSubLabel "第六十四条の八" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第六十四条の八" := by native_decide
example : isArticleSubLabel "第六十四条の六" = true := by native_decide
example : isArticleSubLabel "第六十四条の六" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第六十四条の六" := by native_decide
example : isArticleSubLabel "第六十四条の十" = true := by native_decide
example : isArticleSubLabel "第六十四条の十" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第六十四条の十" := by native_decide
example : isArticleSubLabel "第六十四条の十一" = true := by native_decide
example : isArticleSubLabel "第六十四条の十一" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第六十四条の十一" := by native_decide
example : isArticleSubLabel "第六十四条の十三" = true := by native_decide
example : isArticleSubLabel "第六十四条の十三" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第六十四条の十三" := by native_decide
example : isArticleSubLabel "第六十四条の十二" = true := by native_decide
example : isArticleSubLabel "第六十四条の十二" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第六十四条の十二" := by native_decide
example : isArticleSubLabel "第六十四条の十四" = true := by native_decide
example : isArticleSubLabel "第六十四条の十四" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第六十四条の十四" := by native_decide
example : isArticleSubLabel "第六十四条の四" = true := by native_decide
example : isArticleSubLabel "第六十四条の四" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第六十四条の四" := by native_decide
example : isArticleSubLabel "第六十条の七" = true := by native_decide
example : isArticleSubLabel "第六十条の七" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第六十条の七" := by native_decide
example : isArticleSubLabel "第六十条の九" = true := by native_decide
example : isArticleSubLabel "第六十条の九" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第六十条の九" := by native_decide
example : isArticleSubLabel "第六十条の五" = true := by native_decide
example : isArticleSubLabel "第六十条の五" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第六十条の五" := by native_decide
example : isArticleSubLabel "第六十条の八" = true := by native_decide
example : isArticleSubLabel "第六十条の八" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第六十条の八" := by native_decide
example : isArticleSubLabel "第六十条の六" = true := by native_decide
example : isArticleSubLabel "第六十条の六" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第六十条の六" := by native_decide
example : isArticleSubLabel "第六十条の十" = true := by native_decide
example : isArticleSubLabel "第六十条の十" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第六十条の十" := by native_decide
example : isArticleSubLabel "第六十条の十一" = true := by native_decide
example : isArticleSubLabel "第六十条の十一" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第六十条の十一" := by native_decide
example : isArticleSubLabel "第六十条の十三" = true := by native_decide
example : isArticleSubLabel "第六十条の十三" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第六十条の十三" := by native_decide
example : isArticleSubLabel "第六十条の十二" = true := by native_decide
example : isArticleSubLabel "第六十条の十二" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第六十条の十二" := by native_decide
example : isArticleSubLabel "第六十条の十四" = true := by native_decide
example : isArticleSubLabel "第六十条の十四" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第六十条の十四" := by native_decide
example : isArticleSubLabel "第六十条の四" = true := by native_decide
example : isArticleSubLabel "第六十条の四" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第六十条の四" := by native_decide
example : isArticleSubLabel "第六条の七" = true := by native_decide
example : isArticleSubLabel "第六条の七" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第六条の七" := by native_decide
example : isArticleSubLabel "第六条の九" = true := by native_decide
example : isArticleSubLabel "第六条の九" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第六条の九" := by native_decide
example : isArticleSubLabel "第六条の五" = true := by native_decide
example : isArticleSubLabel "第六条の五" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第六条の五" := by native_decide
example : isArticleSubLabel "第六条の八" = true := by native_decide
example : isArticleSubLabel "第六条の八" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第六条の八" := by native_decide
example : isArticleSubLabel "第六条の六" = true := by native_decide
example : isArticleSubLabel "第六条の六" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第六条の六" := by native_decide
example : isArticleSubLabel "第六条の十" = true := by native_decide
example : isArticleSubLabel "第六条の十" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第六条の十" := by native_decide
example : isArticleSubLabel "第六条の十一" = true := by native_decide
example : isArticleSubLabel "第六条の十一" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第六条の十一" := by native_decide
example : isArticleSubLabel "第六条の十七" = true := by native_decide
example : isArticleSubLabel "第六条の十七" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第六条の十七" := by native_decide
example : isArticleSubLabel "第六条の十三" = true := by native_decide
example : isArticleSubLabel "第六条の十三" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第六条の十三" := by native_decide
example : isArticleSubLabel "第六条の十九" = true := by native_decide
example : isArticleSubLabel "第六条の十九" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第六条の十九" := by native_decide
example : isArticleSubLabel "第六条の十二" = true := by native_decide
example : isArticleSubLabel "第六条の十二" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第六条の十二" := by native_decide
example : isArticleSubLabel "第六条の十五" = true := by native_decide
example : isArticleSubLabel "第六条の十五" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第六条の十五" := by native_decide
example : isArticleSubLabel "第六条の十八" = true := by native_decide
example : isArticleSubLabel "第六条の十八" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第六条の十八" := by native_decide
example : isArticleSubLabel "第六条の十六" = true := by native_decide
example : isArticleSubLabel "第六条の十六" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第六条の十六" := by native_decide
example : isArticleSubLabel "第六条の十四" = true := by native_decide
example : isArticleSubLabel "第六条の十四" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第六条の十四" := by native_decide
example : isArticleSubLabel "第六条の四" = true := by native_decide
example : isArticleSubLabel "第六条の四" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第六条の四" := by native_decide
example : isArticleSubLabel "第十一条の七" = true := by native_decide
example : isArticleSubLabel "第十一条の七" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第十一条の七" := by native_decide
example : isArticleSubLabel "第十一条の九" = true := by native_decide
example : isArticleSubLabel "第十一条の九" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第十一条の九" := by native_decide
example : isArticleSubLabel "第十一条の五" = true := by native_decide
example : isArticleSubLabel "第十一条の五" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第十一条の五" := by native_decide
example : isArticleSubLabel "第十一条の八" = true := by native_decide
example : isArticleSubLabel "第十一条の八" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第十一条の八" := by native_decide
example : isArticleSubLabel "第十一条の六" = true := by native_decide
example : isArticleSubLabel "第十一条の六" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第十一条の六" := by native_decide
example : isArticleSubLabel "第十一条の十" = true := by native_decide
example : isArticleSubLabel "第十一条の十" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第十一条の十" := by native_decide
example : isArticleSubLabel "第十一条の十一" = true := by native_decide
example : isArticleSubLabel "第十一条の十一" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第十一条の十一" := by native_decide
example : isArticleSubLabel "第十一条の十七" = true := by native_decide
example : isArticleSubLabel "第十一条の十七" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第十一条の十七" := by native_decide
example : isArticleSubLabel "第十一条の十三" = true := by native_decide
example : isArticleSubLabel "第十一条の十三" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第十一条の十三" := by native_decide
example : isArticleSubLabel "第十一条の十九" = true := by native_decide
example : isArticleSubLabel "第十一条の十九" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第十一条の十九" := by native_decide
example : isArticleSubLabel "第十一条の十二" = true := by native_decide
example : isArticleSubLabel "第十一条の十二" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第十一条の十二" := by native_decide
example : isArticleSubLabel "第十一条の十五" = true := by native_decide
example : isArticleSubLabel "第十一条の十五" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第十一条の十五" := by native_decide
example : isArticleSubLabel "第十一条の十八" = true := by native_decide
example : isArticleSubLabel "第十一条の十八" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第十一条の十八" := by native_decide
example : isArticleSubLabel "第十一条の十六" = true := by native_decide
example : isArticleSubLabel "第十一条の十六" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第十一条の十六" := by native_decide
example : isArticleSubLabel "第十一条の十四" = true := by native_decide
example : isArticleSubLabel "第十一条の十四" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第十一条の十四" := by native_decide
example : isArticleSubLabel "第十一条の四" = true := by native_decide
example : isArticleSubLabel "第十一条の四" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第十一条の四" := by native_decide
example : isArticleSubLabel "第十七条の五" = true := by native_decide
example : isArticleSubLabel "第十七条の五" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第十七条の五" := by native_decide
example : isArticleSubLabel "第十七条の六" = true := by native_decide
example : isArticleSubLabel "第十七条の六" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第十七条の六" := by native_decide
example : isArticleSubLabel "第十七条の四" = true := by native_decide
example : isArticleSubLabel "第十七条の四" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第十七条の四" := by native_decide
example : isArticleSubLabel "第十三条の七" = true := by native_decide
example : isArticleSubLabel "第十三条の七" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第十三条の七" := by native_decide
example : isArticleSubLabel "第十三条の五" = true := by native_decide
example : isArticleSubLabel "第十三条の五" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第十三条の五" := by native_decide
example : isArticleSubLabel "第十三条の六" = true := by native_decide
example : isArticleSubLabel "第十三条の六" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第十三条の六" := by native_decide
example : isArticleSubLabel "第十三条の四" = true := by native_decide
example : isArticleSubLabel "第十三条の四" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第十三条の四" := by native_decide
example : isArticleSubLabel "第十九条の七" = true := by native_decide
example : isArticleSubLabel "第十九条の七" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第十九条の七" := by native_decide
example : isArticleSubLabel "第十九条の九" = true := by native_decide
example : isArticleSubLabel "第十九条の九" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第十九条の九" := by native_decide
example : isArticleSubLabel "第十九条の五" = true := by native_decide
example : isArticleSubLabel "第十九条の五" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第十九条の五" := by native_decide
example : isArticleSubLabel "第十九条の八" = true := by native_decide
example : isArticleSubLabel "第十九条の八" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第十九条の八" := by native_decide
example : isArticleSubLabel "第十九条の六" = true := by native_decide
example : isArticleSubLabel "第十九条の六" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第十九条の六" := by native_decide
example : isArticleSubLabel "第十九条の十" = true := by native_decide
example : isArticleSubLabel "第十九条の十" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第十九条の十" := by native_decide
example : isArticleSubLabel "第十九条の十一" = true := by native_decide
example : isArticleSubLabel "第十九条の十一" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第十九条の十一" := by native_decide
example : isArticleSubLabel "第十九条の十三" = true := by native_decide
example : isArticleSubLabel "第十九条の十三" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第十九条の十三" := by native_decide
example : isArticleSubLabel "第十九条の十二" = true := by native_decide
example : isArticleSubLabel "第十九条の十二" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第十九条の十二" := by native_decide
example : isArticleSubLabel "第十九条の十五" = true := by native_decide
example : isArticleSubLabel "第十九条の十五" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第十九条の十五" := by native_decide
example : isArticleSubLabel "第十九条の十六" = true := by native_decide
example : isArticleSubLabel "第十九条の十六" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第十九条の十六" := by native_decide
example : isArticleSubLabel "第十九条の十四" = true := by native_decide
example : isArticleSubLabel "第十九条の十四" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第十九条の十四" := by native_decide
example : isArticleSubLabel "第十九条の四" = true := by native_decide
example : isArticleSubLabel "第十九条の四" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第十九条の四" := by native_decide
example : isArticleSubLabel "第十二条の七" = true := by native_decide
example : isArticleSubLabel "第十二条の七" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第十二条の七" := by native_decide
example : isArticleSubLabel "第十二条の五" = true := by native_decide
example : isArticleSubLabel "第十二条の五" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第十二条の五" := by native_decide
example : isArticleSubLabel "第十二条の六" = true := by native_decide
example : isArticleSubLabel "第十二条の六" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第十二条の六" := by native_decide
example : isArticleSubLabel "第十二条の四" = true := by native_decide
example : isArticleSubLabel "第十二条の四" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第十二条の四" := by native_decide
example : isArticleSubLabel "第十五条の七" = true := by native_decide
example : isArticleSubLabel "第十五条の七" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第十五条の七" := by native_decide
example : isArticleSubLabel "第十五条の九" = true := by native_decide
example : isArticleSubLabel "第十五条の九" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第十五条の九" := by native_decide
example : isArticleSubLabel "第十五条の五" = true := by native_decide
example : isArticleSubLabel "第十五条の五" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第十五条の五" := by native_decide
example : isArticleSubLabel "第十五条の八" = true := by native_decide
example : isArticleSubLabel "第十五条の八" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第十五条の八" := by native_decide
example : isArticleSubLabel "第十五条の六" = true := by native_decide
example : isArticleSubLabel "第十五条の六" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第十五条の六" := by native_decide
example : isArticleSubLabel "第十五条の十" = true := by native_decide
example : isArticleSubLabel "第十五条の十" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第十五条の十" := by native_decide
example : isArticleSubLabel "第十五条の十一" = true := by native_decide
example : isArticleSubLabel "第十五条の十一" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第十五条の十一" := by native_decide
example : isArticleSubLabel "第十五条の十二" = true := by native_decide
example : isArticleSubLabel "第十五条の十二" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第十五条の十二" := by native_decide
example : isArticleSubLabel "第十五条の四" = true := by native_decide
example : isArticleSubLabel "第十五条の四" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第十五条の四" := by native_decide
example : isArticleSubLabel "第十八条の七" = true := by native_decide
example : isArticleSubLabel "第十八条の七" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第十八条の七" := by native_decide
example : isArticleSubLabel "第十八条の九" = true := by native_decide
example : isArticleSubLabel "第十八条の九" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第十八条の九" := by native_decide
example : isArticleSubLabel "第十八条の五" = true := by native_decide
example : isArticleSubLabel "第十八条の五" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第十八条の五" := by native_decide
example : isArticleSubLabel "第十八条の八" = true := by native_decide
example : isArticleSubLabel "第十八条の八" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第十八条の八" := by native_decide
example : isArticleSubLabel "第十八条の六" = true := by native_decide
example : isArticleSubLabel "第十八条の六" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第十八条の六" := by native_decide
example : isArticleSubLabel "第十八条の十" = true := by native_decide
example : isArticleSubLabel "第十八条の十" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第十八条の十" := by native_decide
example : isArticleSubLabel "第十八条の十一" = true := by native_decide
example : isArticleSubLabel "第十八条の十一" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第十八条の十一" := by native_decide
example : isArticleSubLabel "第十八条の十七" = true := by native_decide
example : isArticleSubLabel "第十八条の十七" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第十八条の十七" := by native_decide
example : isArticleSubLabel "第十八条の十三" = true := by native_decide
example : isArticleSubLabel "第十八条の十三" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第十八条の十三" := by native_decide
example : isArticleSubLabel "第十八条の十九" = true := by native_decide
example : isArticleSubLabel "第十八条の十九" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第十八条の十九" := by native_decide
example : isArticleSubLabel "第十八条の十二" = true := by native_decide
example : isArticleSubLabel "第十八条の十二" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第十八条の十二" := by native_decide
example : isArticleSubLabel "第十八条の十五" = true := by native_decide
example : isArticleSubLabel "第十八条の十五" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第十八条の十五" := by native_decide
example : isArticleSubLabel "第十八条の十八" = true := by native_decide
example : isArticleSubLabel "第十八条の十八" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第十八条の十八" := by native_decide
example : isArticleSubLabel "第十八条の十六" = true := by native_decide
example : isArticleSubLabel "第十八条の十六" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第十八条の十六" := by native_decide
example : isArticleSubLabel "第十八条の十四" = true := by native_decide
example : isArticleSubLabel "第十八条の十四" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第十八条の十四" := by native_decide
example : isArticleSubLabel "第十八条の四" = true := by native_decide
example : isArticleSubLabel "第十八条の四" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第十八条の四" := by native_decide
example : isArticleSubLabel "第十六条の七" = true := by native_decide
example : isArticleSubLabel "第十六条の七" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第十六条の七" := by native_decide
example : isArticleSubLabel "第十六条の九" = true := by native_decide
example : isArticleSubLabel "第十六条の九" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第十六条の九" := by native_decide
example : isArticleSubLabel "第十六条の五" = true := by native_decide
example : isArticleSubLabel "第十六条の五" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第十六条の五" := by native_decide
example : isArticleSubLabel "第十六条の八" = true := by native_decide
example : isArticleSubLabel "第十六条の八" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第十六条の八" := by native_decide
example : isArticleSubLabel "第十六条の六" = true := by native_decide
example : isArticleSubLabel "第十六条の六" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第十六条の六" := by native_decide
example : isArticleSubLabel "第十六条の十" = true := by native_decide
example : isArticleSubLabel "第十六条の十" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第十六条の十" := by native_decide
example : isArticleSubLabel "第十六条の十一" = true := by native_decide
example : isArticleSubLabel "第十六条の十一" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第十六条の十一" := by native_decide
example : isArticleSubLabel "第十六条の十七" = true := by native_decide
example : isArticleSubLabel "第十六条の十七" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第十六条の十七" := by native_decide
example : isArticleSubLabel "第十六条の十三" = true := by native_decide
example : isArticleSubLabel "第十六条の十三" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第十六条の十三" := by native_decide
example : isArticleSubLabel "第十六条の十九" = true := by native_decide
example : isArticleSubLabel "第十六条の十九" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第十六条の十九" := by native_decide
example : isArticleSubLabel "第十六条の十二" = true := by native_decide
example : isArticleSubLabel "第十六条の十二" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第十六条の十二" := by native_decide
example : isArticleSubLabel "第十六条の十五" = true := by native_decide
example : isArticleSubLabel "第十六条の十五" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第十六条の十五" := by native_decide
example : isArticleSubLabel "第十六条の十八" = true := by native_decide
example : isArticleSubLabel "第十六条の十八" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第十六条の十八" := by native_decide
example : isArticleSubLabel "第十六条の十六" = true := by native_decide
example : isArticleSubLabel "第十六条の十六" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第十六条の十六" := by native_decide
example : isArticleSubLabel "第十六条の十四" = true := by native_decide
example : isArticleSubLabel "第十六条の十四" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第十六条の十四" := by native_decide
example : isArticleSubLabel "第十六条の四" = true := by native_decide
example : isArticleSubLabel "第十六条の四" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第十六条の四" := by native_decide
example : isArticleSubLabel "第十四条の七" = true := by native_decide
example : isArticleSubLabel "第十四条の七" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第十四条の七" := by native_decide
example : isArticleSubLabel "第十四条の九" = true := by native_decide
example : isArticleSubLabel "第十四条の九" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第十四条の九" := by native_decide
example : isArticleSubLabel "第十四条の五" = true := by native_decide
example : isArticleSubLabel "第十四条の五" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第十四条の五" := by native_decide
example : isArticleSubLabel "第十四条の八" = true := by native_decide
example : isArticleSubLabel "第十四条の八" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第十四条の八" := by native_decide
example : isArticleSubLabel "第十四条の六" = true := by native_decide
example : isArticleSubLabel "第十四条の六" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第十四条の六" := by native_decide
example : isArticleSubLabel "第十四条の十" = true := by native_decide
example : isArticleSubLabel "第十四条の十" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第十四条の十" := by native_decide
example : isArticleSubLabel "第十四条の十一" = true := by native_decide
example : isArticleSubLabel "第十四条の十一" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第十四条の十一" := by native_decide
example : isArticleSubLabel "第十四条の十七" = true := by native_decide
example : isArticleSubLabel "第十四条の十七" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第十四条の十七" := by native_decide
example : isArticleSubLabel "第十四条の十三" = true := by native_decide
example : isArticleSubLabel "第十四条の十三" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第十四条の十三" := by native_decide
example : isArticleSubLabel "第十四条の十九" = true := by native_decide
example : isArticleSubLabel "第十四条の十九" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第十四条の十九" := by native_decide
example : isArticleSubLabel "第十四条の十二" = true := by native_decide
example : isArticleSubLabel "第十四条の十二" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第十四条の十二" := by native_decide
example : isArticleSubLabel "第十四条の十五" = true := by native_decide
example : isArticleSubLabel "第十四条の十五" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第十四条の十五" := by native_decide
example : isArticleSubLabel "第十四条の十八" = true := by native_decide
example : isArticleSubLabel "第十四条の十八" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第十四条の十八" := by native_decide
example : isArticleSubLabel "第十四条の十六" = true := by native_decide
example : isArticleSubLabel "第十四条の十六" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第十四条の十六" := by native_decide
example : isArticleSubLabel "第十四条の十四" = true := by native_decide
example : isArticleSubLabel "第十四条の十四" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第十四条の十四" := by native_decide
example : isArticleSubLabel "第十四条の四" = true := by native_decide
example : isArticleSubLabel "第十四条の四" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第十四条の四" := by native_decide
example : isArticleSubLabel "第十条の七" = true := by native_decide
example : isArticleSubLabel "第十条の七" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第十条の七" := by native_decide
example : isArticleSubLabel "第十条の九" = true := by native_decide
example : isArticleSubLabel "第十条の九" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第十条の九" := by native_decide
example : isArticleSubLabel "第十条の五" = true := by native_decide
example : isArticleSubLabel "第十条の五" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第十条の五" := by native_decide
example : isArticleSubLabel "第十条の八" = true := by native_decide
example : isArticleSubLabel "第十条の八" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第十条の八" := by native_decide
example : isArticleSubLabel "第十条の六" = true := by native_decide
example : isArticleSubLabel "第十条の六" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第十条の六" := by native_decide
example : isArticleSubLabel "第十条の十" = true := by native_decide
example : isArticleSubLabel "第十条の十" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第十条の十" := by native_decide
example : isArticleSubLabel "第十条の十一" = true := by native_decide
example : isArticleSubLabel "第十条の十一" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第十条の十一" := by native_decide
example : isArticleSubLabel "第十条の十三" = true := by native_decide
example : isArticleSubLabel "第十条の十三" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第十条の十三" := by native_decide
example : isArticleSubLabel "第十条の十二" = true := by native_decide
example : isArticleSubLabel "第十条の十二" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第十条の十二" := by native_decide
example : isArticleSubLabel "第十条の十五" = true := by native_decide
example : isArticleSubLabel "第十条の十五" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第十条の十五" := by native_decide
example : isArticleSubLabel "第十条の十四" = true := by native_decide
example : isArticleSubLabel "第十条の十四" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第十条の十四" := by native_decide
example : isArticleSubLabel "第十条の四" = true := by native_decide
example : isArticleSubLabel "第十条の四" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第十条の四" := by native_decide
example : isArticleSubLabel "第四十一条の七" = true := by native_decide
example : isArticleSubLabel "第四十一条の七" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第四十一条の七" := by native_decide
example : isArticleSubLabel "第四十一条の九" = true := by native_decide
example : isArticleSubLabel "第四十一条の九" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第四十一条の九" := by native_decide
example : isArticleSubLabel "第四十一条の五" = true := by native_decide
example : isArticleSubLabel "第四十一条の五" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第四十一条の五" := by native_decide
example : isArticleSubLabel "第四十一条の八" = true := by native_decide
example : isArticleSubLabel "第四十一条の八" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第四十一条の八" := by native_decide
example : isArticleSubLabel "第四十一条の六" = true := by native_decide
example : isArticleSubLabel "第四十一条の六" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第四十一条の六" := by native_decide
example : isArticleSubLabel "第四十一条の十" = true := by native_decide
example : isArticleSubLabel "第四十一条の十" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第四十一条の十" := by native_decide
example : isArticleSubLabel "第四十一条の十一" = true := by native_decide
example : isArticleSubLabel "第四十一条の十一" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第四十一条の十一" := by native_decide
example : isArticleSubLabel "第四十一条の十七" = true := by native_decide
example : isArticleSubLabel "第四十一条の十七" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第四十一条の十七" := by native_decide
example : isArticleSubLabel "第四十一条の十三" = true := by native_decide
example : isArticleSubLabel "第四十一条の十三" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第四十一条の十三" := by native_decide
example : isArticleSubLabel "第四十一条の十九" = true := by native_decide
example : isArticleSubLabel "第四十一条の十九" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第四十一条の十九" := by native_decide
example : isArticleSubLabel "第四十一条の十二" = true := by native_decide
example : isArticleSubLabel "第四十一条の十二" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第四十一条の十二" := by native_decide
example : isArticleSubLabel "第四十一条の十五" = true := by native_decide
example : isArticleSubLabel "第四十一条の十五" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第四十一条の十五" := by native_decide
example : isArticleSubLabel "第四十一条の十八" = true := by native_decide
example : isArticleSubLabel "第四十一条の十八" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第四十一条の十八" := by native_decide
example : isArticleSubLabel "第四十一条の十六" = true := by native_decide
example : isArticleSubLabel "第四十一条の十六" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第四十一条の十六" := by native_decide
example : isArticleSubLabel "第四十一条の十四" = true := by native_decide
example : isArticleSubLabel "第四十一条の十四" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第四十一条の十四" := by native_decide
example : isArticleSubLabel "第四十一条の四" = true := by native_decide
example : isArticleSubLabel "第四十一条の四" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第四十一条の四" := by native_decide
example : isArticleSubLabel "第四十七条の七" = true := by native_decide
example : isArticleSubLabel "第四十七条の七" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第四十七条の七" := by native_decide
example : isArticleSubLabel "第四十七条の九" = true := by native_decide
example : isArticleSubLabel "第四十七条の九" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第四十七条の九" := by native_decide
example : isArticleSubLabel "第四十七条の五" = true := by native_decide
example : isArticleSubLabel "第四十七条の五" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第四十七条の五" := by native_decide
example : isArticleSubLabel "第四十七条の八" = true := by native_decide
example : isArticleSubLabel "第四十七条の八" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第四十七条の八" := by native_decide
example : isArticleSubLabel "第四十七条の六" = true := by native_decide
example : isArticleSubLabel "第四十七条の六" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第四十七条の六" := by native_decide
example : isArticleSubLabel "第四十七条の十" = true := by native_decide
example : isArticleSubLabel "第四十七条の十" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第四十七条の十" := by native_decide
example : isArticleSubLabel "第四十七条の四" = true := by native_decide
example : isArticleSubLabel "第四十七条の四" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第四十七条の四" := by native_decide
example : isArticleSubLabel "第四十三条の七" = true := by native_decide
example : isArticleSubLabel "第四十三条の七" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第四十三条の七" := by native_decide
example : isArticleSubLabel "第四十三条の九" = true := by native_decide
example : isArticleSubLabel "第四十三条の九" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第四十三条の九" := by native_decide
example : isArticleSubLabel "第四十三条の五" = true := by native_decide
example : isArticleSubLabel "第四十三条の五" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第四十三条の五" := by native_decide
example : isArticleSubLabel "第四十三条の八" = true := by native_decide
example : isArticleSubLabel "第四十三条の八" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第四十三条の八" := by native_decide
example : isArticleSubLabel "第四十三条の六" = true := by native_decide
example : isArticleSubLabel "第四十三条の六" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第四十三条の六" := by native_decide
example : isArticleSubLabel "第四十三条の十" = true := by native_decide
example : isArticleSubLabel "第四十三条の十" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第四十三条の十" := by native_decide
example : isArticleSubLabel "第四十三条の十一" = true := by native_decide
example : isArticleSubLabel "第四十三条の十一" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第四十三条の十一" := by native_decide
example : isArticleSubLabel "第四十三条の十七" = true := by native_decide
example : isArticleSubLabel "第四十三条の十七" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第四十三条の十七" := by native_decide
example : isArticleSubLabel "第四十三条の十三" = true := by native_decide
example : isArticleSubLabel "第四十三条の十三" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第四十三条の十三" := by native_decide
example : isArticleSubLabel "第四十三条の十九" = true := by native_decide
example : isArticleSubLabel "第四十三条の十九" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第四十三条の十九" := by native_decide
example : isArticleSubLabel "第四十三条の十二" = true := by native_decide
example : isArticleSubLabel "第四十三条の十二" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第四十三条の十二" := by native_decide
example : isArticleSubLabel "第四十三条の十五" = true := by native_decide
example : isArticleSubLabel "第四十三条の十五" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第四十三条の十五" := by native_decide
example : isArticleSubLabel "第四十三条の十八" = true := by native_decide
example : isArticleSubLabel "第四十三条の十八" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第四十三条の十八" := by native_decide
example : isArticleSubLabel "第四十三条の十六" = true := by native_decide
example : isArticleSubLabel "第四十三条の十六" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第四十三条の十六" := by native_decide
example : isArticleSubLabel "第四十三条の十四" = true := by native_decide
example : isArticleSubLabel "第四十三条の十四" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第四十三条の十四" := by native_decide
example : isArticleSubLabel "第四十三条の四" = true := by native_decide
example : isArticleSubLabel "第四十三条の四" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第四十三条の四" := by native_decide
example : isArticleSubLabel "第四十九条の七" = true := by native_decide
example : isArticleSubLabel "第四十九条の七" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第四十九条の七" := by native_decide
example : isArticleSubLabel "第四十九条の九" = true := by native_decide
example : isArticleSubLabel "第四十九条の九" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第四十九条の九" := by native_decide
example : isArticleSubLabel "第四十九条の五" = true := by native_decide
example : isArticleSubLabel "第四十九条の五" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第四十九条の五" := by native_decide
example : isArticleSubLabel "第四十九条の八" = true := by native_decide
example : isArticleSubLabel "第四十九条の八" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第四十九条の八" := by native_decide
example : isArticleSubLabel "第四十九条の六" = true := by native_decide
example : isArticleSubLabel "第四十九条の六" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第四十九条の六" := by native_decide
example : isArticleSubLabel "第四十九条の十" = true := by native_decide
example : isArticleSubLabel "第四十九条の十" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第四十九条の十" := by native_decide
example : isArticleSubLabel "第四十九条の十一" = true := by native_decide
example : isArticleSubLabel "第四十九条の十一" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第四十九条の十一" := by native_decide
example : isArticleSubLabel "第四十九条の十七" = true := by native_decide
example : isArticleSubLabel "第四十九条の十七" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第四十九条の十七" := by native_decide
example : isArticleSubLabel "第四十九条の十三" = true := by native_decide
example : isArticleSubLabel "第四十九条の十三" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第四十九条の十三" := by native_decide
example : isArticleSubLabel "第四十九条の十九" = true := by native_decide
example : isArticleSubLabel "第四十九条の十九" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第四十九条の十九" := by native_decide
example : isArticleSubLabel "第四十九条の十二" = true := by native_decide
example : isArticleSubLabel "第四十九条の十二" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第四十九条の十二" := by native_decide
example : isArticleSubLabel "第四十九条の十五" = true := by native_decide
example : isArticleSubLabel "第四十九条の十五" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第四十九条の十五" := by native_decide
example : isArticleSubLabel "第四十九条の十八" = true := by native_decide
example : isArticleSubLabel "第四十九条の十八" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第四十九条の十八" := by native_decide
example : isArticleSubLabel "第四十九条の十六" = true := by native_decide
example : isArticleSubLabel "第四十九条の十六" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第四十九条の十六" := by native_decide
example : isArticleSubLabel "第四十九条の十四" = true := by native_decide
example : isArticleSubLabel "第四十九条の十四" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第四十九条の十四" := by native_decide
example : isArticleSubLabel "第四十九条の四" = true := by native_decide
example : isArticleSubLabel "第四十九条の四" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第四十九条の四" := by native_decide
example : isArticleSubLabel "第四十二条の七" = true := by native_decide
example : isArticleSubLabel "第四十二条の七" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第四十二条の七" := by native_decide
example : isArticleSubLabel "第四十二条の九" = true := by native_decide
example : isArticleSubLabel "第四十二条の九" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第四十二条の九" := by native_decide
example : isArticleSubLabel "第四十二条の五" = true := by native_decide
example : isArticleSubLabel "第四十二条の五" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第四十二条の五" := by native_decide
example : isArticleSubLabel "第四十二条の六" = true := by native_decide
example : isArticleSubLabel "第四十二条の六" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第四十二条の六" := by native_decide
example : isArticleSubLabel "第四十二条の十" = true := by native_decide
example : isArticleSubLabel "第四十二条の十" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第四十二条の十" := by native_decide
example : isArticleSubLabel "第四十二条の十一" = true := by native_decide
example : isArticleSubLabel "第四十二条の十一" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第四十二条の十一" := by native_decide
example : isArticleSubLabel "第四十二条の十三" = true := by native_decide
example : isArticleSubLabel "第四十二条の十三" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第四十二条の十三" := by native_decide
example : isArticleSubLabel "第四十二条の十二" = true := by native_decide
example : isArticleSubLabel "第四十二条の十二" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第四十二条の十二" := by native_decide
example : isArticleSubLabel "第四十二条の十四" = true := by native_decide
example : isArticleSubLabel "第四十二条の十四" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第四十二条の十四" := by native_decide
example : isArticleSubLabel "第四十二条の四" = true := by native_decide
example : isArticleSubLabel "第四十二条の四" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第四十二条の四" := by native_decide
example : isArticleSubLabel "第四十五条の四" = true := by native_decide
example : isArticleSubLabel "第四十五条の四" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第四十五条の四" := by native_decide
example : isArticleSubLabel "第四十八条の七" = true := by native_decide
example : isArticleSubLabel "第四十八条の七" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第四十八条の七" := by native_decide
example : isArticleSubLabel "第四十八条の九" = true := by native_decide
example : isArticleSubLabel "第四十八条の九" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第四十八条の九" := by native_decide
example : isArticleSubLabel "第四十八条の五" = true := by native_decide
example : isArticleSubLabel "第四十八条の五" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第四十八条の五" := by native_decide
example : isArticleSubLabel "第四十八条の八" = true := by native_decide
example : isArticleSubLabel "第四十八条の八" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第四十八条の八" := by native_decide
example : isArticleSubLabel "第四十八条の六" = true := by native_decide
example : isArticleSubLabel "第四十八条の六" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第四十八条の六" := by native_decide
example : isArticleSubLabel "第四十八条の十" = true := by native_decide
example : isArticleSubLabel "第四十八条の十" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第四十八条の十" := by native_decide
example : isArticleSubLabel "第四十八条の十一" = true := by native_decide
example : isArticleSubLabel "第四十八条の十一" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第四十八条の十一" := by native_decide
example : isArticleSubLabel "第四十八条の十七" = true := by native_decide
example : isArticleSubLabel "第四十八条の十七" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第四十八条の十七" := by native_decide
example : isArticleSubLabel "第四十八条の十三" = true := by native_decide
example : isArticleSubLabel "第四十八条の十三" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第四十八条の十三" := by native_decide
example : isArticleSubLabel "第四十八条の十九" = true := by native_decide
example : isArticleSubLabel "第四十八条の十九" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第四十八条の十九" := by native_decide
example : isArticleSubLabel "第四十八条の十二" = true := by native_decide
example : isArticleSubLabel "第四十八条の十二" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第四十八条の十二" := by native_decide
example : isArticleSubLabel "第四十八条の十五" = true := by native_decide
example : isArticleSubLabel "第四十八条の十五" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第四十八条の十五" := by native_decide
example : isArticleSubLabel "第四十八条の十八" = true := by native_decide
example : isArticleSubLabel "第四十八条の十八" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第四十八条の十八" := by native_decide
example : isArticleSubLabel "第四十八条の十六" = true := by native_decide
example : isArticleSubLabel "第四十八条の十六" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第四十八条の十六" := by native_decide
example : isArticleSubLabel "第四十八条の十四" = true := by native_decide
example : isArticleSubLabel "第四十八条の十四" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第四十八条の十四" := by native_decide
example : isArticleSubLabel "第四十八条の四" = true := by native_decide
example : isArticleSubLabel "第四十八条の四" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第四十八条の四" := by native_decide
example : isArticleSubLabel "第四十六条の七" = true := by native_decide
example : isArticleSubLabel "第四十六条の七" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第四十六条の七" := by native_decide
example : isArticleSubLabel "第四十六条の九" = true := by native_decide
example : isArticleSubLabel "第四十六条の九" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第四十六条の九" := by native_decide
example : isArticleSubLabel "第四十六条の五" = true := by native_decide
example : isArticleSubLabel "第四十六条の五" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第四十六条の五" := by native_decide
example : isArticleSubLabel "第四十六条の八" = true := by native_decide
example : isArticleSubLabel "第四十六条の八" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第四十六条の八" := by native_decide
example : isArticleSubLabel "第四十六条の六" = true := by native_decide
example : isArticleSubLabel "第四十六条の六" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第四十六条の六" := by native_decide
example : isArticleSubLabel "第四十六条の十" = true := by native_decide
example : isArticleSubLabel "第四十六条の十" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第四十六条の十" := by native_decide
example : isArticleSubLabel "第四十六条の十一" = true := by native_decide
example : isArticleSubLabel "第四十六条の十一" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第四十六条の十一" := by native_decide
example : isArticleSubLabel "第四十六条の十三" = true := by native_decide
example : isArticleSubLabel "第四十六条の十三" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第四十六条の十三" := by native_decide
example : isArticleSubLabel "第四十六条の十二" = true := by native_decide
example : isArticleSubLabel "第四十六条の十二" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第四十六条の十二" := by native_decide
example : isArticleSubLabel "第四十六条の十五" = true := by native_decide
example : isArticleSubLabel "第四十六条の十五" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第四十六条の十五" := by native_decide
example : isArticleSubLabel "第四十六条の十六" = true := by native_decide
example : isArticleSubLabel "第四十六条の十六" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第四十六条の十六" := by native_decide
example : isArticleSubLabel "第四十六条の十四" = true := by native_decide
example : isArticleSubLabel "第四十六条の十四" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第四十六条の十四" := by native_decide
example : isArticleSubLabel "第四十六条の四" = true := by native_decide
example : isArticleSubLabel "第四十六条の四" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第四十六条の四" := by native_decide
example : isArticleSubLabel "第四十四条の五" = true := by native_decide
example : isArticleSubLabel "第四十四条の五" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第四十四条の五" := by native_decide
example : isArticleSubLabel "第四十四条の六" = true := by native_decide
example : isArticleSubLabel "第四十四条の六" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第四十四条の六" := by native_decide
example : isArticleSubLabel "第四十四条の四" = true := by native_decide
example : isArticleSubLabel "第四十四条の四" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第四十四条の四" := by native_decide
example : isArticleSubLabel "第四十条の七" = true := by native_decide
example : isArticleSubLabel "第四十条の七" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第四十条の七" := by native_decide
example : isArticleSubLabel "第四十条の九" = true := by native_decide
example : isArticleSubLabel "第四十条の九" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第四十条の九" := by native_decide
example : isArticleSubLabel "第四十条の五" = true := by native_decide
example : isArticleSubLabel "第四十条の五" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第四十条の五" := by native_decide
example : isArticleSubLabel "第四十条の八" = true := by native_decide
example : isArticleSubLabel "第四十条の八" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第四十条の八" := by native_decide
example : isArticleSubLabel "第四十条の六" = true := by native_decide
example : isArticleSubLabel "第四十条の六" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第四十条の六" := by native_decide
example : isArticleSubLabel "第四十条の十" = true := by native_decide
example : isArticleSubLabel "第四十条の十" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第四十条の十" := by native_decide
example : isArticleSubLabel "第四十条の十一" = true := by native_decide
example : isArticleSubLabel "第四十条の十一" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第四十条の十一" := by native_decide
example : isArticleSubLabel "第四十条の十七" = true := by native_decide
example : isArticleSubLabel "第四十条の十七" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第四十条の十七" := by native_decide
example : isArticleSubLabel "第四十条の十三" = true := by native_decide
example : isArticleSubLabel "第四十条の十三" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第四十条の十三" := by native_decide
example : isArticleSubLabel "第四十条の十九" = true := by native_decide
example : isArticleSubLabel "第四十条の十九" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第四十条の十九" := by native_decide
example : isArticleSubLabel "第四十条の十二" = true := by native_decide
example : isArticleSubLabel "第四十条の十二" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第四十条の十二" := by native_decide
example : isArticleSubLabel "第四十条の十五" = true := by native_decide
example : isArticleSubLabel "第四十条の十五" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第四十条の十五" := by native_decide
example : isArticleSubLabel "第四十条の十八" = true := by native_decide
example : isArticleSubLabel "第四十条の十八" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第四十条の十八" := by native_decide
example : isArticleSubLabel "第四十条の十六" = true := by native_decide
example : isArticleSubLabel "第四十条の十六" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第四十条の十六" := by native_decide
example : isArticleSubLabel "第四十条の十四" = true := by native_decide
example : isArticleSubLabel "第四十条の十四" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第四十条の十四" := by native_decide
example : isArticleSubLabel "第四十条の四" = true := by native_decide
example : isArticleSubLabel "第四十条の四" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第四十条の四" := by native_decide
example : isArticleSubLabel "第四条の七" = true := by native_decide
example : isArticleSubLabel "第四条の七" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第四条の七" := by native_decide
example : isArticleSubLabel "第四条の九" = true := by native_decide
example : isArticleSubLabel "第四条の九" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第四条の九" := by native_decide
example : isArticleSubLabel "第四条の五" = true := by native_decide
example : isArticleSubLabel "第四条の五" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第四条の五" := by native_decide
example : isArticleSubLabel "第四条の八" = true := by native_decide
example : isArticleSubLabel "第四条の八" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第四条の八" := by native_decide
example : isArticleSubLabel "第四条の六" = true := by native_decide
example : isArticleSubLabel "第四条の六" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第四条の六" := by native_decide
example : isArticleSubLabel "第四条の十" = true := by native_decide
example : isArticleSubLabel "第四条の十" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第四条の十" := by native_decide
example : isArticleSubLabel "第四条の十一" = true := by native_decide
example : isArticleSubLabel "第四条の十一" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第四条の十一" := by native_decide
example : isArticleSubLabel "第四条の十七" = true := by native_decide
example : isArticleSubLabel "第四条の十七" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第四条の十七" := by native_decide
example : isArticleSubLabel "第四条の十三" = true := by native_decide
example : isArticleSubLabel "第四条の十三" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第四条の十三" := by native_decide
example : isArticleSubLabel "第四条の十九" = true := by native_decide
example : isArticleSubLabel "第四条の十九" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第四条の十九" := by native_decide
example : isArticleSubLabel "第四条の十二" = true := by native_decide
example : isArticleSubLabel "第四条の十二" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第四条の十二" := by native_decide
example : isArticleSubLabel "第四条の十五" = true := by native_decide
example : isArticleSubLabel "第四条の十五" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第四条の十五" := by native_decide
example : isArticleSubLabel "第四条の十八" = true := by native_decide
example : isArticleSubLabel "第四条の十八" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第四条の十八" := by native_decide
example : isArticleSubLabel "第四条の十六" = true := by native_decide
example : isArticleSubLabel "第四条の十六" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第四条の十六" := by native_decide
example : isArticleSubLabel "第四条の十四" = true := by native_decide
example : isArticleSubLabel "第四条の十四" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第四条の十四" := by native_decide
example : isArticleSubLabel "第四条の四" = true := by native_decide
example : isArticleSubLabel "第四条の四" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第四条の四" := by native_decide
example : isArticleSubLabel "第四百八十五条の五" = true := by native_decide
example : isArticleSubLabel "第四百八十五条の五" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第四百八十五条の五" := by native_decide
example : isArticleSubLabel "第四百八十五条の六" = true := by native_decide
example : isArticleSubLabel "第四百八十五条の六" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第四百八十五条の六" := by native_decide
example : isArticleSubLabel "第四百八十五条の十三" = true := by native_decide
example : isArticleSubLabel "第四百八十五条の十三" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第四百八十五条の十三" := by native_decide
example : isArticleSubLabel "第四百八十五条の十四" = true := by native_decide
example : isArticleSubLabel "第四百八十五条の十四" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第四百八十五条の十四" := by native_decide
example : isArticleSubLabel "第四百八十五条の四" = true := by native_decide
example : isArticleSubLabel "第四百八十五条の四" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第四百八十五条の四" := by native_decide
example : isArticleSubLabel "第百三十一条の七" = true := by native_decide
example : isArticleSubLabel "第百三十一条の七" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第百三十一条の七" := by native_decide
example : isArticleSubLabel "第百三十一条の九" = true := by native_decide
example : isArticleSubLabel "第百三十一条の九" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第百三十一条の九" := by native_decide
example : isArticleSubLabel "第百三十一条の五" = true := by native_decide
example : isArticleSubLabel "第百三十一条の五" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第百三十一条の五" := by native_decide
example : isArticleSubLabel "第百三十一条の八" = true := by native_decide
example : isArticleSubLabel "第百三十一条の八" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第百三十一条の八" := by native_decide
example : isArticleSubLabel "第百三十一条の六" = true := by native_decide
example : isArticleSubLabel "第百三十一条の六" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第百三十一条の六" := by native_decide
example : isArticleSubLabel "第百三十一条の十" = true := by native_decide
example : isArticleSubLabel "第百三十一条の十" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第百三十一条の十" := by native_decide
example : isArticleSubLabel "第百三十一条の十一" = true := by native_decide
example : isArticleSubLabel "第百三十一条の十一" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第百三十一条の十一" := by native_decide
example : isArticleSubLabel "第百三十一条の十七" = true := by native_decide
example : isArticleSubLabel "第百三十一条の十七" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第百三十一条の十七" := by native_decide
example : isArticleSubLabel "第百三十一条の十三" = true := by native_decide
example : isArticleSubLabel "第百三十一条の十三" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第百三十一条の十三" := by native_decide
example : isArticleSubLabel "第百三十一条の十九" = true := by native_decide
example : isArticleSubLabel "第百三十一条の十九" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第百三十一条の十九" := by native_decide
example : isArticleSubLabel "第百三十一条の十二" = true := by native_decide
example : isArticleSubLabel "第百三十一条の十二" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第百三十一条の十二" := by native_decide
example : isArticleSubLabel "第百三十一条の十五" = true := by native_decide
example : isArticleSubLabel "第百三十一条の十五" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第百三十一条の十五" := by native_decide
example : isArticleSubLabel "第百三十一条の十八" = true := by native_decide
example : isArticleSubLabel "第百三十一条の十八" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第百三十一条の十八" := by native_decide
example : isArticleSubLabel "第百三十一条の十六" = true := by native_decide
example : isArticleSubLabel "第百三十一条の十六" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第百三十一条の十六" := by native_decide
example : isArticleSubLabel "第百三十一条の十四" = true := by native_decide
example : isArticleSubLabel "第百三十一条の十四" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第百三十一条の十四" := by native_decide
example : isArticleSubLabel "第百三十一条の四" = true := by native_decide
example : isArticleSubLabel "第百三十一条の四" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第百三十一条の四" := by native_decide
example : isArticleSubLabel "第百三十九条の七" = true := by native_decide
example : isArticleSubLabel "第百三十九条の七" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第百三十九条の七" := by native_decide
example : isArticleSubLabel "第百三十九条の九" = true := by native_decide
example : isArticleSubLabel "第百三十九条の九" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第百三十九条の九" := by native_decide
example : isArticleSubLabel "第百三十九条の五" = true := by native_decide
example : isArticleSubLabel "第百三十九条の五" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第百三十九条の五" := by native_decide
example : isArticleSubLabel "第百三十九条の八" = true := by native_decide
example : isArticleSubLabel "第百三十九条の八" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第百三十九条の八" := by native_decide
example : isArticleSubLabel "第百三十九条の六" = true := by native_decide
example : isArticleSubLabel "第百三十九条の六" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第百三十九条の六" := by native_decide
example : isArticleSubLabel "第百三十九条の十" = true := by native_decide
example : isArticleSubLabel "第百三十九条の十" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第百三十九条の十" := by native_decide
example : isArticleSubLabel "第百三十九条の四" = true := by native_decide
example : isArticleSubLabel "第百三十九条の四" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第百三十九条の四" := by native_decide
example : isArticleSubLabel "第百九十五条の四" = true := by native_decide
example : isArticleSubLabel "第百九十五条の四" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第百九十五条の四" := by native_decide
example : isArticleSubLabel "第百二十一条の七" = true := by native_decide
example : isArticleSubLabel "第百二十一条の七" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第百二十一条の七" := by native_decide
example : isArticleSubLabel "第百二十一条の九" = true := by native_decide
example : isArticleSubLabel "第百二十一条の九" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第百二十一条の九" := by native_decide
example : isArticleSubLabel "第百二十一条の五" = true := by native_decide
example : isArticleSubLabel "第百二十一条の五" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第百二十一条の五" := by native_decide
example : isArticleSubLabel "第百二十一条の八" = true := by native_decide
example : isArticleSubLabel "第百二十一条の八" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第百二十一条の八" := by native_decide
example : isArticleSubLabel "第百二十一条の六" = true := by native_decide
example : isArticleSubLabel "第百二十一条の六" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第百二十一条の六" := by native_decide
example : isArticleSubLabel "第百二十一条の十" = true := by native_decide
example : isArticleSubLabel "第百二十一条の十" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第百二十一条の十" := by native_decide
example : isArticleSubLabel "第百二十一条の十一" = true := by native_decide
example : isArticleSubLabel "第百二十一条の十一" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第百二十一条の十一" := by native_decide
example : isArticleSubLabel "第百二十一条の四" = true := by native_decide
example : isArticleSubLabel "第百二十一条の四" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第百二十一条の四" := by native_decide
example : isArticleSubLabel "第百二十三条の七" = true := by native_decide
example : isArticleSubLabel "第百二十三条の七" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第百二十三条の七" := by native_decide
example : isArticleSubLabel "第百二十三条の九" = true := by native_decide
example : isArticleSubLabel "第百二十三条の九" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第百二十三条の九" := by native_decide
example : isArticleSubLabel "第百二十三条の五" = true := by native_decide
example : isArticleSubLabel "第百二十三条の五" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第百二十三条の五" := by native_decide
example : isArticleSubLabel "第百二十三条の八" = true := by native_decide
example : isArticleSubLabel "第百二十三条の八" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第百二十三条の八" := by native_decide
example : isArticleSubLabel "第百二十三条の六" = true := by native_decide
example : isArticleSubLabel "第百二十三条の六" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第百二十三条の六" := by native_decide
example : isArticleSubLabel "第百二十三条の十" = true := by native_decide
example : isArticleSubLabel "第百二十三条の十" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第百二十三条の十" := by native_decide
example : isArticleSubLabel "第百二十三条の十一" = true := by native_decide
example : isArticleSubLabel "第百二十三条の十一" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第百二十三条の十一" := by native_decide
example : isArticleSubLabel "第百二十三条の四" = true := by native_decide
example : isArticleSubLabel "第百二十三条の四" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第百二十三条の四" := by native_decide
example : isArticleSubLabel "第百二十二条の七" = true := by native_decide
example : isArticleSubLabel "第百二十二条の七" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第百二十二条の七" := by native_decide
example : isArticleSubLabel "第百二十二条の九" = true := by native_decide
example : isArticleSubLabel "第百二十二条の九" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第百二十二条の九" := by native_decide
example : isArticleSubLabel "第百二十二条の五" = true := by native_decide
example : isArticleSubLabel "第百二十二条の五" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第百二十二条の五" := by native_decide
example : isArticleSubLabel "第百二十二条の八" = true := by native_decide
example : isArticleSubLabel "第百二十二条の八" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第百二十二条の八" := by native_decide
example : isArticleSubLabel "第百二十二条の六" = true := by native_decide
example : isArticleSubLabel "第百二十二条の六" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第百二十二条の六" := by native_decide
example : isArticleSubLabel "第百二十二条の十" = true := by native_decide
example : isArticleSubLabel "第百二十二条の十" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第百二十二条の十" := by native_decide
example : isArticleSubLabel "第百二十二条の十一" = true := by native_decide
example : isArticleSubLabel "第百二十二条の十一" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第百二十二条の十一" := by native_decide
example : isArticleSubLabel "第百二十二条の十三" = true := by native_decide
example : isArticleSubLabel "第百二十二条の十三" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第百二十二条の十三" := by native_decide
example : isArticleSubLabel "第百二十二条の十二" = true := by native_decide
example : isArticleSubLabel "第百二十二条の十二" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第百二十二条の十二" := by native_decide
example : isArticleSubLabel "第百二十二条の四" = true := by native_decide
example : isArticleSubLabel "第百二十二条の四" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第百二十二条の四" := by native_decide
example : isArticleSubLabel "第百五十一条の五" = true := by native_decide
example : isArticleSubLabel "第百五十一条の五" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第百五十一条の五" := by native_decide
example : isArticleSubLabel "第百五十一条の六" = true := by native_decide
example : isArticleSubLabel "第百五十一条の六" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第百五十一条の六" := by native_decide
example : isArticleSubLabel "第百五十一条の四" = true := by native_decide
example : isArticleSubLabel "第百五十一条の四" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第百五十一条の四" := by native_decide
example : isArticleSubLabel "第百五十三条の五" = true := by native_decide
example : isArticleSubLabel "第百五十三条の五" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第百五十三条の五" := by native_decide
example : isArticleSubLabel "第百五十三条の六" = true := by native_decide
example : isArticleSubLabel "第百五十三条の六" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第百五十三条の六" := by native_decide
example : isArticleSubLabel "第百五十三条の四" = true := by native_decide
example : isArticleSubLabel "第百五十三条の四" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第百五十三条の四" := by native_decide
example : isArticleSubLabel "第百五十五条の七" = true := by native_decide
example : isArticleSubLabel "第百五十五条の七" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第百五十五条の七" := by native_decide
example : isArticleSubLabel "第百五十五条の七十" = true := by native_decide
example : isArticleSubLabel "第百五十五条の七十" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第百五十五条の七十" := by native_decide
example : isArticleSubLabel "第百五十五条の七十一" = true := by native_decide
example : isArticleSubLabel "第百五十五条の七十一" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第百五十五条の七十一" := by native_decide
example : isArticleSubLabel "第百五十五条の七十七" = true := by native_decide
example : isArticleSubLabel "第百五十五条の七十七" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第百五十五条の七十七" := by native_decide
example : isArticleSubLabel "第百五十五条の七十三" = true := by native_decide
example : isArticleSubLabel "第百五十五条の七十三" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第百五十五条の七十三" := by native_decide
example : isArticleSubLabel "第百五十五条の七十九" = true := by native_decide
example : isArticleSubLabel "第百五十五条の七十九" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第百五十五条の七十九" := by native_decide
example : isArticleSubLabel "第百五十五条の七十二" = true := by native_decide
example : isArticleSubLabel "第百五十五条の七十二" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第百五十五条の七十二" := by native_decide
example : isArticleSubLabel "第百五十五条の七十五" = true := by native_decide
example : isArticleSubLabel "第百五十五条の七十五" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第百五十五条の七十五" := by native_decide
example : isArticleSubLabel "第百五十五条の七十八" = true := by native_decide
example : isArticleSubLabel "第百五十五条の七十八" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第百五十五条の七十八" := by native_decide
example : isArticleSubLabel "第百五十五条の七十六" = true := by native_decide
example : isArticleSubLabel "第百五十五条の七十六" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第百五十五条の七十六" := by native_decide
example : isArticleSubLabel "第百五十五条の七十四" = true := by native_decide
example : isArticleSubLabel "第百五十五条の七十四" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第百五十五条の七十四" := by native_decide
example : isArticleSubLabel "第百五十五条の九" = true := by native_decide
example : isArticleSubLabel "第百五十五条の九" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第百五十五条の九" := by native_decide
example : isArticleSubLabel "第百五十五条の五" = true := by native_decide
example : isArticleSubLabel "第百五十五条の五" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第百五十五条の五" := by native_decide
example : isArticleSubLabel "第百五十五条の五十" = true := by native_decide
example : isArticleSubLabel "第百五十五条の五十" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第百五十五条の五十" := by native_decide
example : isArticleSubLabel "第百五十五条の五十一" = true := by native_decide
example : isArticleSubLabel "第百五十五条の五十一" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第百五十五条の五十一" := by native_decide
example : isArticleSubLabel "第百五十五条の五十七" = true := by native_decide
example : isArticleSubLabel "第百五十五条の五十七" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第百五十五条の五十七" := by native_decide
example : isArticleSubLabel "第百五十五条の五十三" = true := by native_decide
example : isArticleSubLabel "第百五十五条の五十三" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第百五十五条の五十三" := by native_decide
example : isArticleSubLabel "第百五十五条の五十九" = true := by native_decide
example : isArticleSubLabel "第百五十五条の五十九" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第百五十五条の五十九" := by native_decide
example : isArticleSubLabel "第百五十五条の五十二" = true := by native_decide
example : isArticleSubLabel "第百五十五条の五十二" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第百五十五条の五十二" := by native_decide
example : isArticleSubLabel "第百五十五条の五十五" = true := by native_decide
example : isArticleSubLabel "第百五十五条の五十五" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第百五十五条の五十五" := by native_decide
example : isArticleSubLabel "第百五十五条の五十八" = true := by native_decide
example : isArticleSubLabel "第百五十五条の五十八" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第百五十五条の五十八" := by native_decide
example : isArticleSubLabel "第百五十五条の五十六" = true := by native_decide
example : isArticleSubLabel "第百五十五条の五十六" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第百五十五条の五十六" := by native_decide
example : isArticleSubLabel "第百五十五条の五十四" = true := by native_decide
example : isArticleSubLabel "第百五十五条の五十四" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第百五十五条の五十四" := by native_decide
example : isArticleSubLabel "第百五十五条の八" = true := by native_decide
example : isArticleSubLabel "第百五十五条の八" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第百五十五条の八" := by native_decide
example : isArticleSubLabel "第百五十五条の八十" = true := by native_decide
example : isArticleSubLabel "第百五十五条の八十" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第百五十五条の八十" := by native_decide
example : isArticleSubLabel "第百五十五条の八十一" = true := by native_decide
example : isArticleSubLabel "第百五十五条の八十一" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第百五十五条の八十一" := by native_decide
example : isArticleSubLabel "第百五十五条の六" = true := by native_decide
example : isArticleSubLabel "第百五十五条の六" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第百五十五条の六" := by native_decide
example : isArticleSubLabel "第百五十五条の六十" = true := by native_decide
example : isArticleSubLabel "第百五十五条の六十" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第百五十五条の六十" := by native_decide
example : isArticleSubLabel "第百五十五条の六十一" = true := by native_decide
example : isArticleSubLabel "第百五十五条の六十一" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第百五十五条の六十一" := by native_decide
example : isArticleSubLabel "第百五十五条の六十七" = true := by native_decide
example : isArticleSubLabel "第百五十五条の六十七" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第百五十五条の六十七" := by native_decide
example : isArticleSubLabel "第百五十五条の六十三" = true := by native_decide
example : isArticleSubLabel "第百五十五条の六十三" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第百五十五条の六十三" := by native_decide
example : isArticleSubLabel "第百五十五条の六十九" = true := by native_decide
example : isArticleSubLabel "第百五十五条の六十九" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第百五十五条の六十九" := by native_decide
example : isArticleSubLabel "第百五十五条の六十二" = true := by native_decide
example : isArticleSubLabel "第百五十五条の六十二" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第百五十五条の六十二" := by native_decide
example : isArticleSubLabel "第百五十五条の六十五" = true := by native_decide
example : isArticleSubLabel "第百五十五条の六十五" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第百五十五条の六十五" := by native_decide
example : isArticleSubLabel "第百五十五条の六十八" = true := by native_decide
example : isArticleSubLabel "第百五十五条の六十八" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第百五十五条の六十八" := by native_decide
example : isArticleSubLabel "第百五十五条の六十六" = true := by native_decide
example : isArticleSubLabel "第百五十五条の六十六" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第百五十五条の六十六" := by native_decide
example : isArticleSubLabel "第百五十五条の六十四" = true := by native_decide
example : isArticleSubLabel "第百五十五条の六十四" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第百五十五条の六十四" := by native_decide
example : isArticleSubLabel "第百五十五条の十" = true := by native_decide
example : isArticleSubLabel "第百五十五条の十" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第百五十五条の十" := by native_decide
example : isArticleSubLabel "第百五十五条の十一" = true := by native_decide
example : isArticleSubLabel "第百五十五条の十一" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第百五十五条の十一" := by native_decide
example : isArticleSubLabel "第百五十五条の十七" = true := by native_decide
example : isArticleSubLabel "第百五十五条の十七" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第百五十五条の十七" := by native_decide
example : isArticleSubLabel "第百五十五条の十三" = true := by native_decide
example : isArticleSubLabel "第百五十五条の十三" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第百五十五条の十三" := by native_decide
example : isArticleSubLabel "第百五十五条の十九" = true := by native_decide
example : isArticleSubLabel "第百五十五条の十九" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第百五十五条の十九" := by native_decide
example : isArticleSubLabel "第百五十五条の十二" = true := by native_decide
example : isArticleSubLabel "第百五十五条の十二" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第百五十五条の十二" := by native_decide
example : isArticleSubLabel "第百五十五条の十五" = true := by native_decide
example : isArticleSubLabel "第百五十五条の十五" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第百五十五条の十五" := by native_decide
example : isArticleSubLabel "第百五十五条の十八" = true := by native_decide
example : isArticleSubLabel "第百五十五条の十八" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第百五十五条の十八" := by native_decide
example : isArticleSubLabel "第百五十五条の十六" = true := by native_decide
example : isArticleSubLabel "第百五十五条の十六" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第百五十五条の十六" := by native_decide
example : isArticleSubLabel "第百五十五条の十四" = true := by native_decide
example : isArticleSubLabel "第百五十五条の十四" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第百五十五条の十四" := by native_decide
example : isArticleSubLabel "第百五十五条の四" = true := by native_decide
example : isArticleSubLabel "第百五十五条の四" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第百五十五条の四" := by native_decide
example : isArticleSubLabel "第百五十五条の四十" = true := by native_decide
example : isArticleSubLabel "第百五十五条の四十" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第百五十五条の四十" := by native_decide
example : isArticleSubLabel "第百五十五条の四十一" = true := by native_decide
example : isArticleSubLabel "第百五十五条の四十一" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第百五十五条の四十一" := by native_decide
example : isArticleSubLabel "第百五十五条の四十七" = true := by native_decide
example : isArticleSubLabel "第百五十五条の四十七" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第百五十五条の四十七" := by native_decide
example : isArticleSubLabel "第百五十五条の四十三" = true := by native_decide
example : isArticleSubLabel "第百五十五条の四十三" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第百五十五条の四十三" := by native_decide
example : isArticleSubLabel "第百五十五条の四十九" = true := by native_decide
example : isArticleSubLabel "第百五十五条の四十九" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第百五十五条の四十九" := by native_decide
example : isArticleSubLabel "第百五十五条の四十二" = true := by native_decide
example : isArticleSubLabel "第百五十五条の四十二" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第百五十五条の四十二" := by native_decide
example : isArticleSubLabel "第百五十五条の四十五" = true := by native_decide
example : isArticleSubLabel "第百五十五条の四十五" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第百五十五条の四十五" := by native_decide
example : isArticleSubLabel "第百五十五条の四十八" = true := by native_decide
example : isArticleSubLabel "第百五十五条の四十八" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第百五十五条の四十八" := by native_decide
example : isArticleSubLabel "第百五十五条の四十六" = true := by native_decide
example : isArticleSubLabel "第百五十五条の四十六" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第百五十五条の四十六" := by native_decide
example : isArticleSubLabel "第百五十五条の四十四" = true := by native_decide
example : isArticleSubLabel "第百五十五条の四十四" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第百五十五条の四十四" := by native_decide
example : isArticleSubLabel "第百五十六条の四" = true := by native_decide
example : isArticleSubLabel "第百五十六条の四" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第百五十六条の四" := by native_decide
example : isArticleSubLabel "第百五十条の四" = true := by native_decide
example : isArticleSubLabel "第百五十条の四" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第百五十条の四" := by native_decide
example : isArticleSubLabel "第百八条の四" = true := by native_decide
example : isArticleSubLabel "第百八条の四" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第百八条の四" := by native_decide
example : isArticleSubLabel "第百六十七条の七" = true := by native_decide
example : isArticleSubLabel "第百六十七条の七" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第百六十七条の七" := by native_decide
example : isArticleSubLabel "第百六十七条の五" = true := by native_decide
example : isArticleSubLabel "第百六十七条の五" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第百六十七条の五" := by native_decide
example : isArticleSubLabel "第百六十七条の六" = true := by native_decide
example : isArticleSubLabel "第百六十七条の六" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第百六十七条の六" := by native_decide
example : isArticleSubLabel "第百六十七条の四" = true := by native_decide
example : isArticleSubLabel "第百六十七条の四" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第百六十七条の四" := by native_decide
example : isArticleSubLabel "第百六十五条の五" = true := by native_decide
example : isArticleSubLabel "第百六十五条の五" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第百六十五条の五" := by native_decide
example : isArticleSubLabel "第百六十五条の六" = true := by native_decide
example : isArticleSubLabel "第百六十五条の六" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第百六十五条の六" := by native_decide
example : isArticleSubLabel "第百六十五条の四" = true := by native_decide
example : isArticleSubLabel "第百六十五条の四" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第百六十五条の四" := by native_decide
example : isArticleSubLabel "第百十一条の四" = true := by native_decide
example : isArticleSubLabel "第百十一条の四" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第百十一条の四" := by native_decide
example : isArticleSubLabel "第百十七条の五" = true := by native_decide
example : isArticleSubLabel "第百十七条の五" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第百十七条の五" := by native_decide
example : isArticleSubLabel "第百十七条の四" = true := by native_decide
example : isArticleSubLabel "第百十七条の四" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第百十七条の四" := by native_decide
example : isArticleSubLabel "第百十九条の七" = true := by native_decide
example : isArticleSubLabel "第百十九条の七" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第百十九条の七" := by native_decide
example : isArticleSubLabel "第百十九条の九" = true := by native_decide
example : isArticleSubLabel "第百十九条の九" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第百十九条の九" := by native_decide
example : isArticleSubLabel "第百十九条の五" = true := by native_decide
example : isArticleSubLabel "第百十九条の五" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第百十九条の五" := by native_decide
example : isArticleSubLabel "第百十九条の八" = true := by native_decide
example : isArticleSubLabel "第百十九条の八" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第百十九条の八" := by native_decide
example : isArticleSubLabel "第百十九条の六" = true := by native_decide
example : isArticleSubLabel "第百十九条の六" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第百十九条の六" := by native_decide
example : isArticleSubLabel "第百十九条の十" = true := by native_decide
example : isArticleSubLabel "第百十九条の十" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第百十九条の十" := by native_decide
example : isArticleSubLabel "第百十九条の十一" = true := by native_decide
example : isArticleSubLabel "第百十九条の十一" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第百十九条の十一" := by native_decide
example : isArticleSubLabel "第百十九条の十三" = true := by native_decide
example : isArticleSubLabel "第百十九条の十三" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第百十九条の十三" := by native_decide
example : isArticleSubLabel "第百十九条の十二" = true := by native_decide
example : isArticleSubLabel "第百十九条の十二" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第百十九条の十二" := by native_decide
example : isArticleSubLabel "第百十九条の十五" = true := by native_decide
example : isArticleSubLabel "第百十九条の十五" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第百十九条の十五" := by native_decide
example : isArticleSubLabel "第百十九条の十六" = true := by native_decide
example : isArticleSubLabel "第百十九条の十六" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第百十九条の十六" := by native_decide
example : isArticleSubLabel "第百十九条の十四" = true := by native_decide
example : isArticleSubLabel "第百十九条の十四" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第百十九条の十四" := by native_decide
example : isArticleSubLabel "第百十九条の四" = true := by native_decide
example : isArticleSubLabel "第百十九条の四" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第百十九条の四" := by native_decide
example : isArticleSubLabel "第百十八条の七" = true := by native_decide
example : isArticleSubLabel "第百十八条の七" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第百十八条の七" := by native_decide
example : isArticleSubLabel "第百十八条の九" = true := by native_decide
example : isArticleSubLabel "第百十八条の九" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第百十八条の九" := by native_decide
example : isArticleSubLabel "第百十八条の五" = true := by native_decide
example : isArticleSubLabel "第百十八条の五" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第百十八条の五" := by native_decide
example : isArticleSubLabel "第百十八条の八" = true := by native_decide
example : isArticleSubLabel "第百十八条の八" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第百十八条の八" := by native_decide
example : isArticleSubLabel "第百十八条の六" = true := by native_decide
example : isArticleSubLabel "第百十八条の六" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第百十八条の六" := by native_decide
example : isArticleSubLabel "第百十八条の十" = true := by native_decide
example : isArticleSubLabel "第百十八条の十" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第百十八条の十" := by native_decide
example : isArticleSubLabel "第百十八条の十一" = true := by native_decide
example : isArticleSubLabel "第百十八条の十一" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第百十八条の十一" := by native_decide
example : isArticleSubLabel "第百十八条の十二" = true := by native_decide
example : isArticleSubLabel "第百十八条の十二" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第百十八条の十二" := by native_decide
example : isArticleSubLabel "第百十八条の四" = true := by native_decide
example : isArticleSubLabel "第百十八条の四" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第百十八条の四" := by native_decide
example : isArticleSubLabel "第百四十一条の七" = true := by native_decide
example : isArticleSubLabel "第百四十一条の七" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第百四十一条の七" := by native_decide
example : isArticleSubLabel "第百四十一条の五" = true := by native_decide
example : isArticleSubLabel "第百四十一条の五" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第百四十一条の五" := by native_decide
example : isArticleSubLabel "第百四十一条の八" = true := by native_decide
example : isArticleSubLabel "第百四十一条の八" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第百四十一条の八" := by native_decide
example : isArticleSubLabel "第百四十一条の六" = true := by native_decide
example : isArticleSubLabel "第百四十一条の六" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第百四十一条の六" := by native_decide
example : isArticleSubLabel "第百四十一条の四" = true := by native_decide
example : isArticleSubLabel "第百四十一条の四" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第百四十一条の四" := by native_decide
example : isArticleSubLabel "第百四十七条の四" = true := by native_decide
example : isArticleSubLabel "第百四十七条の四" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第百四十七条の四" := by native_decide
example : isArticleSubLabel "第百四十二条の七" = true := by native_decide
example : isArticleSubLabel "第百四十二条の七" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第百四十二条の七" := by native_decide
example : isArticleSubLabel "第百四十二条の九" = true := by native_decide
example : isArticleSubLabel "第百四十二条の九" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第百四十二条の九" := by native_decide
example : isArticleSubLabel "第百四十二条の五" = true := by native_decide
example : isArticleSubLabel "第百四十二条の五" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第百四十二条の五" := by native_decide
example : isArticleSubLabel "第百四十二条の八" = true := by native_decide
example : isArticleSubLabel "第百四十二条の八" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第百四十二条の八" := by native_decide
example : isArticleSubLabel "第百四十二条の六" = true := by native_decide
example : isArticleSubLabel "第百四十二条の六" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第百四十二条の六" := by native_decide
example : isArticleSubLabel "第百四十二条の十" = true := by native_decide
example : isArticleSubLabel "第百四十二条の十" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第百四十二条の十" := by native_decide
example : isArticleSubLabel "第百四十二条の四" = true := by native_decide
example : isArticleSubLabel "第百四十二条の四" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第百四十二条の四" := by native_decide
example : isArticleSubLabel "第百四十五条の七" = true := by native_decide
example : isArticleSubLabel "第百四十五条の七" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第百四十五条の七" := by native_decide
example : isArticleSubLabel "第百四十五条の九" = true := by native_decide
example : isArticleSubLabel "第百四十五条の九" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第百四十五条の九" := by native_decide
example : isArticleSubLabel "第百四十五条の五" = true := by native_decide
example : isArticleSubLabel "第百四十五条の五" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第百四十五条の五" := by native_decide
example : isArticleSubLabel "第百四十五条の八" = true := by native_decide
example : isArticleSubLabel "第百四十五条の八" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第百四十五条の八" := by native_decide
example : isArticleSubLabel "第百四十五条の六" = true := by native_decide
example : isArticleSubLabel "第百四十五条の六" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第百四十五条の六" := by native_decide
example : isArticleSubLabel "第百四十五条の十" = true := by native_decide
example : isArticleSubLabel "第百四十五条の十" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第百四十五条の十" := by native_decide
example : isArticleSubLabel "第百四十五条の十一" = true := by native_decide
example : isArticleSubLabel "第百四十五条の十一" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第百四十五条の十一" := by native_decide
example : isArticleSubLabel "第百四十五条の十三" = true := by native_decide
example : isArticleSubLabel "第百四十五条の十三" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第百四十五条の十三" := by native_decide
example : isArticleSubLabel "第百四十五条の十二" = true := by native_decide
example : isArticleSubLabel "第百四十五条の十二" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第百四十五条の十二" := by native_decide
example : isArticleSubLabel "第百四十五条の十五" = true := by native_decide
example : isArticleSubLabel "第百四十五条の十五" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第百四十五条の十五" := by native_decide
example : isArticleSubLabel "第百四十五条の十四" = true := by native_decide
example : isArticleSubLabel "第百四十五条の十四" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第百四十五条の十四" := by native_decide
example : isArticleSubLabel "第百四十五条の四" = true := by native_decide
example : isArticleSubLabel "第百四十五条の四" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第百四十五条の四" := by native_decide
example : isArticleSubLabel "第百四十四条の七" = true := by native_decide
example : isArticleSubLabel "第百四十四条の七" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第百四十四条の七" := by native_decide
example : isArticleSubLabel "第百四十四条の九" = true := by native_decide
example : isArticleSubLabel "第百四十四条の九" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第百四十四条の九" := by native_decide
example : isArticleSubLabel "第百四十四条の五" = true := by native_decide
example : isArticleSubLabel "第百四十四条の五" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第百四十四条の五" := by native_decide
example : isArticleSubLabel "第百四十四条の五十" = true := by native_decide
example : isArticleSubLabel "第百四十四条の五十" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第百四十四条の五十" := by native_decide
example : isArticleSubLabel "第百四十四条の五十一" = true := by native_decide
example : isArticleSubLabel "第百四十四条の五十一" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第百四十四条の五十一" := by native_decide
example : isArticleSubLabel "第百四十四条の五十三" = true := by native_decide
example : isArticleSubLabel "第百四十四条の五十三" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第百四十四条の五十三" := by native_decide
example : isArticleSubLabel "第百四十四条の五十二" = true := by native_decide
example : isArticleSubLabel "第百四十四条の五十二" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第百四十四条の五十二" := by native_decide
example : isArticleSubLabel "第百四十四条の五十四" = true := by native_decide
example : isArticleSubLabel "第百四十四条の五十四" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第百四十四条の五十四" := by native_decide
example : isArticleSubLabel "第百四十四条の八" = true := by native_decide
example : isArticleSubLabel "第百四十四条の八" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第百四十四条の八" := by native_decide
example : isArticleSubLabel "第百四十四条の六" = true := by native_decide
example : isArticleSubLabel "第百四十四条の六" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第百四十四条の六" := by native_decide
example : isArticleSubLabel "第百四十四条の六十" = true := by native_decide
example : isArticleSubLabel "第百四十四条の六十" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第百四十四条の六十" := by native_decide
example : isArticleSubLabel "第百四十四条の十" = true := by native_decide
example : isArticleSubLabel "第百四十四条の十" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第百四十四条の十" := by native_decide
example : isArticleSubLabel "第百四十四条の十一" = true := by native_decide
example : isArticleSubLabel "第百四十四条の十一" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第百四十四条の十一" := by native_decide
example : isArticleSubLabel "第百四十四条の十七" = true := by native_decide
example : isArticleSubLabel "第百四十四条の十七" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第百四十四条の十七" := by native_decide
example : isArticleSubLabel "第百四十四条の十三" = true := by native_decide
example : isArticleSubLabel "第百四十四条の十三" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第百四十四条の十三" := by native_decide
example : isArticleSubLabel "第百四十四条の十九" = true := by native_decide
example : isArticleSubLabel "第百四十四条の十九" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第百四十四条の十九" := by native_decide
example : isArticleSubLabel "第百四十四条の十二" = true := by native_decide
example : isArticleSubLabel "第百四十四条の十二" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第百四十四条の十二" := by native_decide
example : isArticleSubLabel "第百四十四条の十五" = true := by native_decide
example : isArticleSubLabel "第百四十四条の十五" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第百四十四条の十五" := by native_decide
example : isArticleSubLabel "第百四十四条の十八" = true := by native_decide
example : isArticleSubLabel "第百四十四条の十八" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第百四十四条の十八" := by native_decide
example : isArticleSubLabel "第百四十四条の十六" = true := by native_decide
example : isArticleSubLabel "第百四十四条の十六" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第百四十四条の十六" := by native_decide
example : isArticleSubLabel "第百四十四条の十四" = true := by native_decide
example : isArticleSubLabel "第百四十四条の十四" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第百四十四条の十四" := by native_decide
example : isArticleSubLabel "第百四十四条の四" = true := by native_decide
example : isArticleSubLabel "第百四十四条の四" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第百四十四条の四" := by native_decide
example : isArticleSubLabel "第百四十四条の四十" = true := by native_decide
example : isArticleSubLabel "第百四十四条の四十" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第百四十四条の四十" := by native_decide
example : isArticleSubLabel "第百四十四条の四十一" = true := by native_decide
example : isArticleSubLabel "第百四十四条の四十一" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第百四十四条の四十一" := by native_decide
example : isArticleSubLabel "第百四十四条の四十七" = true := by native_decide
example : isArticleSubLabel "第百四十四条の四十七" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第百四十四条の四十七" := by native_decide
example : isArticleSubLabel "第百四十四条の四十三" = true := by native_decide
example : isArticleSubLabel "第百四十四条の四十三" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第百四十四条の四十三" := by native_decide
example : isArticleSubLabel "第百四十四条の四十九" = true := by native_decide
example : isArticleSubLabel "第百四十四条の四十九" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第百四十四条の四十九" := by native_decide
example : isArticleSubLabel "第百四十四条の四十二" = true := by native_decide
example : isArticleSubLabel "第百四十四条の四十二" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第百四十四条の四十二" := by native_decide
example : isArticleSubLabel "第百四十四条の四十五" = true := by native_decide
example : isArticleSubLabel "第百四十四条の四十五" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第百四十四条の四十五" := by native_decide
example : isArticleSubLabel "第百四十四条の四十八" = true := by native_decide
example : isArticleSubLabel "第百四十四条の四十八" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第百四十四条の四十八" := by native_decide
example : isArticleSubLabel "第百四十四条の四十六" = true := by native_decide
example : isArticleSubLabel "第百四十四条の四十六" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第百四十四条の四十六" := by native_decide
example : isArticleSubLabel "第百四十四条の四十四" = true := by native_decide
example : isArticleSubLabel "第百四十四条の四十四" = JapanTaxLaw.ArticleSubNumberLabelsSpec.isSubLabelSpec "第百四十四条の四十四" := by native_decide

example : articleSubDeclared = true := article_sub_is_declaration

end JapanTaxLaw.ArticleSubNumberLabelsTests
