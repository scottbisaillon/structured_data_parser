/// Removes or replaces character sequences found in the [input].
String? sanitizeInput(String? input) =>
    input?.replaceAll('&amp;', '&').replaceAll('&nbsp;', ' ').trim();
