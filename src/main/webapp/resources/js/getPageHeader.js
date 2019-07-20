class PageHeader extends React.Component {
    render() {     
        var resourcePath=document.getElementById('resourcesPath');
        return (
            <div className="nav-container">
            <img src={resourcePath.href+"/resources/img/logo.png"} alt="logo" className="logoImg"></img>
                <ul>
                    <li><a href="/">Home</a></li>
                    <li><a href="/employee/table">1) Employee Table</a></li>
                    <li><a href="/employee/map">2) Employee Map</a></li>
                    <li><a href="/job/map">3) Job Map</a></li>
                </ul>
            </div>
        );
    }
};
ReactDOM.render(
    <PageHeader />,
    document.getElementById('reactPageHeader')
);