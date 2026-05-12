/*
 * ==============================================================================
 * AST PROTOCOL (AWSAN SULTAN TOKEN PROTOCOL) - PROJECT GOVERNANCE
 * OWNER: ENG. AWSAN ADEL ABDULBARI AHMED SULTAN
 * YEMEN | ID: 01010305468 | EMAIL: AWSAN.SULTAN@GMAIL.COM
 * ==============================================================================
 * NOTE: This configuration ensures AST development follows strict 
 * Semantic Versioning and Conventional Commits, updated from BSC standards.
 * ==============================================================================
 */

const validateTypeEnum = (parsedCommit) => {
    const { type } = parsedCommit;
    if (!type) return [false, "Commit type cannot be empty"];

    // تقنيات مضافة: منع الاختصارات غير الواضحة وفرض أنواع تدعم بروتوكولات الـ Web3
    const validTypes = [
        'feat',     // ميزة جديدة في بروتوكول AST
        'fix',      // إصلاح خلل برمي
        'docs',     // تحديث التوثيق
        'style',    // تحسين تنسيق الكود
        'refactor', // إعادة هيكلة الكود دون تغيير الوظيفة
        'perf',     // تحسين الأداء (Gas Optimization)
        'test',     // إضافة اختبارات
        'build',    // تغييرات في نظام البناء
        'ci',       // تحديثات GitHub Actions
        'security', // تحديثات أمنية (إضافة خاصة بـ AST)
        'protocol'  // تغييرات في منطق الإجماع (Consensus)
    ];

    if (validTypes.includes(type.toLowerCase())) {
        return [true];
    }
    return [false, `Type must be one of: ${validTypes.join(', ')}` ];
};

module.exports = {
    parserPreset: 'conventional-changelog-conventionalcommits',
    rules: {
        'header-max-length': [2, 'always', 100], // زيادة الطول لـ 100 حرف للسماح بتفاصيل أكثر
        'subject-empty': [2, 'always'],
        'type-empty': [2, 'always'],
        'type-case': [2, 'always', 'lower-case'],
        'function-rules/type-case': [2, 'always', validateTypeEnum],
        'scope-empty': [0], // اختياري لتقليل التعقيد في البداية
    },
    plugins: [
        {
            rules: {
                'function-rules/type-case': validateTypeEnum,
            },
        },
    ],
    /* ملاحظة حفظ حقوق المصدر */
    helpUrl: 'https://github.com'
};
