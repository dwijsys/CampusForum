// Small beginner-friendly interactions. No database is used in this first version.
function showMessage(message) {
    const box = document.getElementById('toast');
    box.textContent = message;
    box.classList.add('visible');
    setTimeout(() => box.classList.remove('visible'), 3500);
}

document.addEventListener('click', function (event) {
    const button = event.target.closest('[data-toggle]');
    if (button) {
        const on = button.dataset.on || 'Selected \u2713';
        const off = button.dataset.off || button.textContent;
        const selected = button.dataset.selected === 'yes';
        button.textContent = selected ? off : on;
        button.dataset.selected = selected ? 'no' : 'yes';
        showMessage(selected ? 'Selection removed.' : 'Selection updated for this demo.');
    }
    const demo = event.target.closest('[data-demo]');
    if (demo) showMessage(demo.dataset.demo || 'Demo action only. Database not connected.');
});

// One ASP.NET <form runat="server"> wraps the page. Buttons with .NET validators
// post back to their individual .aspx.cs handlers; do not intercept submissions.
document.addEventListener('keydown', function (event) {
    if (event.target && event.target.id === 'globalSearchInput' && event.key === 'Enter') {
        event.preventDefault();
        window.location.href = '/Common/Search.aspx?q=' + encodeURIComponent(event.target.value || '');
    }
});

// Switch visible categories without creating additional pages.
document.addEventListener('click', function (event) {
    const filter = event.target.closest('[data-filter]');
    if (!filter) return;
    const group = filter.closest('[data-filter-group]');
    if (!group) return;
    group.querySelectorAll('[data-filter]').forEach(x => x.classList.remove('active'));
    filter.classList.add('active');
    const choice = filter.dataset.filter;
    const target = group.dataset.filterGroup;
    document.querySelectorAll('[data-category-group="' + target + '"]').forEach(item => {
        item.hidden = choice !== 'all' && item.dataset.category !== choice;
    });
});
