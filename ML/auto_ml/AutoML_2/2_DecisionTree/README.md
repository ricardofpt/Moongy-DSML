# Summary of 2_DecisionTree

[<< Go back](../README.md)


## Decision Tree
- **n_jobs**: -1
- **criterion**: gini
- **max_depth**: 3
- **explain_level**: 2

## Validation
 - **validation_type**: split
 - **train_ratio**: 0.75
 - **shuffle**: True
 - **stratify**: True

## Optimized metric
logloss

## Training time

13.1 seconds

## Metric details
|           |    score |   threshold |
|:----------|---------:|------------:|
| logloss   | 0.365743 | nan         |
| auc       | 0.858619 | nan         |
| f1        | 0.620205 |   0.304623  |
| accuracy  | 0.842461 |   0.304623  |
| precision | 0.994186 |   0.982143  |
| recall    | 1        |   0.0223728 |
| mcc       | 0.543019 |   0.304623  |


## Metric details with threshold from accuracy metric
|           |    score |   threshold |
|:----------|---------:|------------:|
| logloss   | 0.365743 |  nan        |
| auc       | 0.858619 |  nan        |
| f1        | 0.620205 |    0.304623 |
| accuracy  | 0.842461 |    0.304623 |
| precision | 0.77538  |    0.304623 |
| recall    | 0.516782 |    0.304623 |
| mcc       | 0.543019 |    0.304623 |


## Confusion matrix (at threshold=0.304623)
|              |   Predicted as 0 |   Predicted as 1 |
|:-------------|-----------------:|-----------------:|
| Labeled as 0 |             5383 |              281 |
| Labeled as 1 |              907 |              970 |

## Learning curves
![Learning curves](learning_curves.png)

## Decision Tree 

### Tree #1
![Tree 1](learner_fold_0_tree.svg)

### Rules

if (Marital status_ Married-civ-spouse <= 0.5) and (Capital-gain <= 7073.5) and (Education-num <= 12.5) then class: 0 (proba: 97.51%) | based on 9,373 samples

if (Marital status_ Married-civ-spouse > 0.5) and (Education-num <= 12.5) and (Capital-gain <= 5095.5) then class: 0 (proba: 69.54%) | based on 7,117 samples

if (Marital status_ Married-civ-spouse > 0.5) and (Education-num > 12.5) and (Capital-gain <= 5095.5) then class: 1 (proba: 67.91%) | based on 2,649 samples

if (Marital status_ Married-civ-spouse <= 0.5) and (Capital-gain <= 7073.5) and (Education-num > 12.5) then class: 0 (proba: 84.86%) | based on 2,397 samples

if (Marital status_ Married-civ-spouse > 0.5) and (Education-num > 12.5) and (Capital-gain > 5095.5) then class: 1 (proba: 99.79%) | based on 468 samples

if (Marital status_ Married-civ-spouse > 0.5) and (Education-num <= 12.5) and (Capital-gain > 5095.5) then class: 1 (proba: 97.69%) | based on 390 samples

if (Marital status_ Married-civ-spouse <= 0.5) and (Capital-gain > 7073.5) and (Age > 20.5) then class: 1 (proba: 98.21%) | based on 224 samples

if (Marital status_ Married-civ-spouse <= 0.5) and (Capital-gain > 7073.5) and (Age <= 20.5) then class: 0 (proba: 100.0%) | based on 2 samples





## Permutation-based Importance
![Permutation-based Importance](permutation_importance.png)
## Confusion Matrix

![Confusion Matrix](confusion_matrix.png)


## Normalized Confusion Matrix

![Normalized Confusion Matrix](confusion_matrix_normalized.png)


## ROC Curve

![ROC Curve](roc_curve.png)


## Kolmogorov-Smirnov Statistic

![Kolmogorov-Smirnov Statistic](ks_statistic.png)


## Precision-Recall Curve

![Precision-Recall Curve](precision_recall_curve.png)


## Calibration Curve

![Calibration Curve](calibration_curve_curve.png)


## Cumulative Gains Curve

![Cumulative Gains Curve](cumulative_gains_curve.png)


## Lift Curve

![Lift Curve](lift_curve.png)



## SHAP Importance
![SHAP Importance](shap_importance.png)

## SHAP Dependence plots

### Dependence (Fold 1)
![SHAP Dependence from Fold 1](learner_fold_0_shap_dependence.png)

## SHAP Decision plots


[<< Go back](../README.md)
