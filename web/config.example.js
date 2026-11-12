// LaunchOS — configuração do acesso externo.
// COMO USAR:
//  1. Copie este arquivo para "config.js" (mesmo nome, sem ".example").
//  2. Troque os dois valores abaixo pelos do SEU projeto Supabase:
//     Supabase -> Project Settings -> API
//        - "Project URL"            -> vai em url
//        - "Project API keys: anon public" -> vai em anonKey
//  3. Suba "config.js" junto com o index.html no Cloudflare Pages.
//
// Observação: a chave "anon public" é PÚBLICA por design — pode ficar no site.
// A segurança vem das políticas RLS no banco, não do segredo da chave.
// NUNCA use aqui a chave "service_role" (essa é secreta — jamais no site).

window.LAUNCHOS_CFG = {
  url: "https://SEU-PROJETO.supabase.co",
  anonKey: "COLE_AQUI_A_CHAVE_ANON_PUBLIC"
};
