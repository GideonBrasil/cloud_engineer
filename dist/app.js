"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = __importDefault(require("express"));
require('dotenv').config();
const app = (0, express_1.default)();
app.use(express_1.default.json());
const payload = {
    message: "Automate all the things!",
    timestamp: 1529729125
};
// Routes
app.get('/', (req, res) => {
    res.send('Server up and runnig.');
});
app.get('/api/timestamps', (req, res) => {
    res.json(payload);
});
// Error handling
app.use((err, req, res, next) => {
    console.error(err.stack);
    res.status(500).send('Please be patient, something went wrong!');
});
// Export the app for use in other files, such as tests
exports.default = app;
// Start server
const port = process.env.PORT || 3000;
if (require.main === module) {
    app.listen(port, () => console.log(`Listening on port ${port}...`));
}
;
//# sourceMappingURL=app.js.map